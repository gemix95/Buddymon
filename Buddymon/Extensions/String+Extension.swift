//
//  String+Extension"swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 29/01/21"
//

import Foundation
import UIKit


extension String {
    public var color: UIColor {
        switch self {
        case "normal":
            return .normal
        case "fighting":
            return .fighting
        case "flying":
            return .flying
        case "poison":
            return .poison
        case "ground":
            return .ground
        case "rock":
            return .rock
        case "bug":
            return .bug
        case "ghost":
            return .ghost
        case "steel":
            return .steel
        case "fire":
            return .fire
        case "water":
            return .water
        case "grass":
            return .grass
        case "electric":
            return .electric
        case "psychic":
            return .psychic
        case "ice":
            return .ice
        case "dragon":
            return .dragon
        case "dark":
            return .dark
        case "fairy":
            return .fairy
        case "unknown":
            return .unknown
        case "shadow":
            return .shadow
        default:
            return .normal
        }
    }
}
