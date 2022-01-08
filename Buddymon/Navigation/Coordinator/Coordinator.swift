//
//  Coordinator.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    func start() -> UIViewController
}

public protocol MainCoordinable: AnyObject {
    func set(root: Coordinator)
    func set(root: Coordinator, animated: Bool)
}

public extension MainCoordinable {
    func set(root: Coordinator) {
        set(root: root, animated: false)
    }
}
