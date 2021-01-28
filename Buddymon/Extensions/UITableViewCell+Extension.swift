//
//  UITableViewCell+Extension.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var customIdentifier: String {
        return String(describing: self)
    }
}
