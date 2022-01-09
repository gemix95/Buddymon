//
//  Networkable.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import Foundation

public protocol Networkable {
    func start<T: Codable>(request: URLRequest, completion: @escaping (Result<T, APIsError>) -> Void )
}
