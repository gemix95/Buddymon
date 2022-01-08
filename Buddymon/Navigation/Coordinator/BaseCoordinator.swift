//
//  BaseCoordinator.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation
import UIKit

open class BaseCoordinator<View: Coordinable, Param>: Coordinator {
    public let context: Context
    public var param: Param
    public weak var view: View!
    
    public init(context: Context, param: Param) {
        self.context = context
        self.param = param
    }
    
    deinit {
        print("🔴 Deinit \(type(of: self))")
    }
    
    
    public final func start() -> UIViewController {
//        guard
//            let coordinator = self as? View.Coordinator,
//            let viewController = create(coordinator: coordinator) as? UIViewController else {
//                preconditionFailure("Error instantiating ViewController")
//            }
        let coordinator = self as! View.Coordinator
        let viewController = create(coordinator: coordinator) as! UIViewController

        return viewController
    }
    
    private func create(coordinator: View.Coordinator) -> View {
        let viewController = View(coordinator: coordinator)
        view = viewController
        return viewController
    }
}
