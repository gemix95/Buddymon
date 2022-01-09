//
//  Requestable.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import Foundation

public final class Requestable: Networkable {
    public func start<T>(request: URLRequest, completion: @escaping (Result<T, APIsError>) -> Void) where T: Codable {
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
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                print("✅✅✅✅✅")
                print("\(String(data: data, encoding: .utf8) ?? "")\n")
                completion(.success(decodedObject))
            } catch let error {
                print("❌❌❌❌❌")
                print("\(error.localizedDescription)\n")
                let data = String(data: data, encoding: .utf8) ?? ""
                print("\n \(data)")
                completion(.failure(.jsonParsingError(error as! DecodingError)))
            }
        }).resume()
    }
}
