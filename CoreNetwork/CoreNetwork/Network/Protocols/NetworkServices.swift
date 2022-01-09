//
//  NetworkServices.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import Foundation

public protocol NetworkServices {
    func get(listLenght: Int, completion: @escaping (Result<PokemonResponse, APIsError>) -> Void )
    func getPokemonDetail(id: String, completion: @escaping (Result<PokemonDetails, APIsError>) -> Void )
}
