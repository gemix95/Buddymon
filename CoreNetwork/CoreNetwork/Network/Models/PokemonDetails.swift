//
//  PokemonDetails.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation
import UIKit

public struct PokemonDetails: Codable {
    public let types: [TypeElement]
    public let height, weight: Double
    public let abilities: [AbilityElement]
    public let stats: [Stat]
    
    public var statList: [EasyStatistics] {
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

public struct AbilityElement: Codable {
    public let ability: StatClass
    public let isHidden: Bool
    public let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

public struct StatClass: Codable {
    public let name: String
    public let url: String
}

public struct Stat: Codable {
    public let baseStat, effort: Int
    public let stat: StatClass

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

public struct TypeElement: Codable {
    public let slot: Int
    public let type: StatClass
}

public struct EasyStatistics: Codable {
    public let name: String
    public let value: String
}
