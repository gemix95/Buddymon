//
//  Pokemon.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation

struct PokemonResponse: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let urlDetails: String
    var imageUrl: String {
        var stringId = urlDetails.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        stringId.removeLast(1)
        guard let id = Int(stringId) else { return "" }
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case urlDetails = "url"
    }
}

