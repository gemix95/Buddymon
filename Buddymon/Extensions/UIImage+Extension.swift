//
//  UIImage+Extension.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 29/01/21.
//

import Foundation
import UIKit

extension UIImageView {
    func roundImage() {
        layer.masksToBounds = false
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
}
