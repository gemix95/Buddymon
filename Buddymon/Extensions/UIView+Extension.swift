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
    
    func pinEdges(to other: UIView) {
        leadingAnchor.constraint(equalTo: other.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: other.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: other.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: other.bottomAnchor).isActive = true
    }
    
    func removeAllSubViews(tag: Int) {
        self.subviews.filter({$0.tag == tag}).forEach({$0.removeFromSuperview()})
    }
}
