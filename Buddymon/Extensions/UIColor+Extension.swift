//
//  UIColor+Extension.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 29/01/21.
//

import Foundation
import UIKit

extension UIColor {
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    
    static var normal = UIColor.rgb(160, 160, 160)
               
    static var fighting = UIColor.rgb(282, 81, 86)
               
    static var flying = UIColor.rgb(84, 151, 238)
               
    static var poison = UIColor.rgb(155, 96, 192)
               
    static var ground = UIColor.rgb(189, 154, 49)
               
    static var rock = UIColor.rgb(247, 191, 29)
               
    static var bug = UIColor.rgb(69, 198, 71)
              
    static var ghost = UIColor.rgb(99, 88, 167)
               
    static var steel = UIColor.rgb(112, 119, 148)
               
    static var fire = UIColor.rgb(254, 152, 84)
               
    static var water = UIColor.rgb(85, 187, 246)
               
    static var grass = UIColor.rgb(139, 189, 11)
               
    static var electric = UIColor.rgb(227, 205, 10)
               
    static var psychic = UIColor.rgb(228, 98, 241)
               
    static var ice = UIColor.rgb(84, 230, 243)
               
    static var dragon = UIColor.rgb(252, 116, 71)
               
    static var dark = UIColor.rgb(85, 109, 203)
               
    static var fairy = UIColor.rgb(248, 95, 136)
               
    static var unknown = UIColor.rgb(40, 40, 40)
               
    static var shadow = UIColor.rgb(42, 55, 62)
}
