//
//  UIView.swift
//  BuddymonTests
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import Foundation
import UIKit

public extension UIView {
    
    func getView<T: UIView>(_ identifier: String) throws -> T {
        let matchingViews: [T] = getSubviews(from: self)

        guard !matchingViews.isEmpty else {
            throw ViewError.typeNotFound(String(describing: T.self))
        }

        guard let matchingView = matchingViews.first(where: { $0.accessibilityIdentifier == identifier }) else {
            throw ViewError.identifierNotFound(identifier)
        }

        return matchingView
    }

    func getSubviews<T: UIView>(matching type: T.Type) -> [T] {
        getSubviews(from: self)
    }

    private func getSubviews<T: UIView>(from view: UIView) -> [T] {
        var all = [T]()

        if let view = view as? T {
            all.append(view)
        }

        for subview in view.subviews {
            let results: [T] = getSubviews(from: subview)
            all.append(contentsOf: results)
        }

        return all
    }
}

