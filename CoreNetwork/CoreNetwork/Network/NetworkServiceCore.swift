//
//  NetworkServiceCore.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import Foundation

public final class NetworkServiceCore: NetworkServices {
    let networkable: Networkable
    
    public init(networkable: Networkable) {
        self.networkable = networkable
    }
    
    public func get(listLenght: Int, completion: @escaping (Result<PokemonResponse, APIsError>) -> Void) {
        let queryItems = [URLQueryItem(name: "limit", value: "\(listLenght)"), URLQueryItem(name: "offset", value: "0")]
        var urlComps = URLComponents(string: "https://pokeapi.co/api/v2/pokemon")
        urlComps?.queryItems = queryItems
        let url = urlComps?.url
        
        guard let url = url else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethods.get.rawValue
        
        networkable.start(request: request, completion: completion)
    }
    
    public func getPokemonDetail(id: String, completion: @escaping (Result<PokemonDetails, APIsError>) -> Void) {
        var url = URL(string: "https://pokeapi.co/api/v2/pokemon")
        url?.appendPathComponent(id)
        
        guard let url = url else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethods.get.rawValue
        
        networkable.start(request: request, completion: completion)
    }
}
