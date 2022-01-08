//
//  Coordinable.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation

public protocol Coordinable: AnyObject {
    associatedtype Coordinator
    init(coordinator: Coordinator)
}
