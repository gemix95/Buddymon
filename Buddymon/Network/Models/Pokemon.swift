//
//  Pokemon.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation

public struct PokemonResponse: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable, Hashable {
    let name: String
    let urlDetails: String
    var imageUrl: String {
        var stringId = urlDetails.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        stringId.removeLast(1)
        guard let id = Int(stringId) else { return "" }
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
    var id: String {
        var stringId = urlDetails.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        stringId.removeLast(1)
        return stringId
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case urlDetails = "url"
    }
}
