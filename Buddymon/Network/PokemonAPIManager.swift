//
//  PokemonAPIManager.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation

class PokemonAPIManager {
    
    var url: URL?
    
    let endPoint: String = {
        return "https://pokeapi.co/api/v2/"
    }()
    
    enum Path: String {
        case pokemon = "pokemon"
    }
    
    enum HttpMethods: String {
        case get
        case post
        case put
        case delete
    }
    
    public enum ApiError: Error {
        case networkError(Error)
        case dataNotFound
        case jsonParsingError(Error)
        case invalidStatusCode
        case badUrl
        case generic(String?)
        
        public var localized: String {
            switch self {
            case .generic(let message):
                return message ?? "Generic error, try again later."
            case .networkError(let error):
                return error.localizedDescription
            case .dataNotFound:
                return "No data available"
            case .invalidStatusCode:
                return "Invalid status code"
            case .badUrl:
                return "Bad url"
            case .jsonParsingError(let error):
                return error.localizedDescription
            }
        }
    }

    public enum Result<T> {
        case success(T)
        case failure(ApiError)
    }
    
    private let timeoutInterval: TimeInterval = 30.0
    
    static let shared = PokemonAPIManager()
    
    func getPokemon(listLenght: Int? = nil, pokemonDetails: Int? = nil, httpMethod: HttpMethods = .get, completion: @escaping (Result<[Pokemon]>) -> Void ) {
  
        if let listLenght = listLenght {
            let queryItems = [URLQueryItem(name: "limit", value: "\(listLenght)"), URLQueryItem(name: "offset", value: "0")]
            var urlComps = URLComponents(string: endPoint + Path.pokemon.rawValue)
            urlComps?.queryItems = queryItems
            self.url = urlComps?.url
        }
        
        if let pokemonDetails = pokemonDetails {
            var composingURL = URL(string: endPoint + Path.pokemon.rawValue)
            composingURL?.appendPathComponent(String(pokemonDetails))
            self.url = composingURL
        }
        
        guard let url = self.url else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            print("\n\n🔥🔥🔥🔥🔥")
            print("\(request.url?.absoluteString ?? "undefined url")")
            
            if let body = request.httpBody {
                print("💊 Body: \(String(data: body, encoding: .utf8) ?? "undefined httpBody")")
            }
            
            guard error == nil else {
                print("❌❌❌❌❌")
                print("\(error?.localizedDescription ?? "undefined error")")
                completion(.failure(.networkError(error!)))
                return
            }
            
            guard let data = data else {
                print("❌❌❌❌❌")
                print("NO DATA FOUND")
                completion(.failure(.dataNotFound))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("❌❌❌❌❌")
                print("error \(httpResponse.statusCode)")
                completion(.failure(.invalidStatusCode))
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(PokemonResponse.self, from: data)
                print("✅✅✅✅✅")
                print("\(String(data: data, encoding: .utf8) ?? "")\n")
                completion(.success(decodedObject.results))
            } catch let error {
                print("❌❌❌❌❌")
                print("\(error.localizedDescription)\n")
                let errore = String(data: data, encoding: .utf8) ?? ""
                print("\n \(errore)")
                completion(.failure(.jsonParsingError(error as! DecodingError)))
            }
        }).resume()
    }

}
