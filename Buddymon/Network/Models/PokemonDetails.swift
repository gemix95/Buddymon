//
//  PokemonDetails.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation
import UIKit

public struct PokemonDetails: Codable {
    let types: [TypeElement]
    let height, weight: Double
    let abilities: [AbilityElement]
    let stats: [Stat]
    
    var statList: [EasyStatistics] {
        var stats = [EasyStatistics]()
        stats.append(EasyStatistics(name: "Types", value: types.map({$0.type.name}).joined(separator: " / ")))
        stats.append(EasyStatistics(name: "Height", value: "\(height/10)m"))
        stats.append(EasyStatistics(name: "Weight", value: "\(weight/10)kg"))
        
        for (index, ability) in abilities.enumerated() {
            stats.append(EasyStatistics(name: "Ability \(index)", value: ability.ability.name))
        }
        
        for stat in self.stats {
            stats.append(EasyStatistics(name: stat.stat.name, value: "\(stat.baseStat)"))
        }
        
        return stats
    }
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

struct EasyStatistics {
    let name: String
    let value: String
}
