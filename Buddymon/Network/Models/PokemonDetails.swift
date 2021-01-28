//
//  PokemonDetails.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation
import UIKit

struct PokemonDetails: Codable {
    let types: [TypeElement]
    let height, weight: Int
    let abilities: [AbilityElement]
    let stats: [Stat]
}

struct AbilityElement: Codable {
    let ability: StatClass
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

struct StatClass: Codable {
    let name: String
    let url: String
}

struct Stat: Codable {
    let baseStat, effort: Int
    let stat: StatClass

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

struct TypeElement: Codable {
    let slot: Int
    let type: StatClass
}
