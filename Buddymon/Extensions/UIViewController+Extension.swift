//
//  UIViewController+Extension.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation
import UIKit

extension UIViewController {
    var lastViewController: UIViewController? {
        if let nvc = self as? UINavigationController {
            return nvc.visibleViewController
        }
        
        if let pvc = self.presentedViewController {
            return pvc
        }
        
        return self
    }
}
