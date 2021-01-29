//
//  UIView+Extension.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(round: CGFloat = 30) {
        layer.masksToBounds = false
        layer.cornerRadius = round
        layer.shadowOffset = CGSize(width: 3, height: 4)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.25
    }
}
