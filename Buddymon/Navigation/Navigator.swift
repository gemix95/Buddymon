//
//  Navigator.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation
import UIKit

public protocol Navigator {
    @discardableResult
    func start(coordinator: Coordinator, animated: Bool) -> UIWindow
    
    // raw present
    func present(viewController: UIViewController, presentationStyle: UIModalPresentationStyle)
    
    // navigation
    func navigate(to coordinator: Coordinator, animated: Bool)
    
    // dismiss
    func dismiss()
    func dismissToRoot()
    
    // main
    func set(root: Coordinator)
}

public extension Navigator {
    func present(viewController: UIViewController) {
        present(viewController: viewController, presentationStyle: .fullScreen)
    }
}
