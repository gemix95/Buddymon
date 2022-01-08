//
//  StandardNavigator.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation
import UIKit


public final class StandardNavigator: NSObject {
    private let window = UIWindow(frame: UIScreen.main.bounds)
    private var mainCoordinator: MainCoordinable?
}

extension StandardNavigator: Navigator {
    public func set(root: Coordinator) {
        guard let main = mainCoordinator else { return }
        main.set(root: root, animated: false)
    }
    
    public func present(viewController: UIViewController, presentationStyle: UIModalPresentationStyle) {
        viewController.modalPresentationStyle = presentationStyle
        window.rootViewController?.present(viewController, animated: true)
    }
    
    @discardableResult
    public func start(coordinator: Coordinator, animated: Bool = true) -> UIWindow {
        guard window.rootViewController != nil else {
            window.rootViewController = UINavigationController(rootViewController: coordinator.start())
            window.makeKeyAndVisible()
            return window
        }
        
        dismiss()
        mainCoordinator = nil
        if let nvc = window.rootViewController as? UINavigationController {
            nvc.viewControllers.removeAll()
            nvc.delegate = nil
            window.rootViewController = nil
        }
        
        if let main = coordinator as? MainCoordinable {
            mainCoordinator = main
        }
        
        if animated == true {
            let options: UIView.AnimationOptions = [.transitionCrossDissolve, .showHideTransitionViews, .layoutSubviews, .allowAnimatedContent]
            UIView.transition(with: window, duration: 0.5, options: options, animations: {
                self.startRoot(coordinator: coordinator)
            }, completion: { _ in } )
        } else {
            startRoot(coordinator: coordinator)
        }
        return window
    }
    
    private func startRoot(coordinator: Coordinator) {
        let root = coordinator.start()
        let state = UIView.areAnimationsEnabled
        UIView.setAnimationsEnabled(false)
        window.rootViewController = root
        UIView.setAnimationsEnabled(state)
    }
    
    public func navigate(to coordinator: Coordinator, animated: Bool = true) {
        go(to: coordinator.start(), animated: animated)
    }
    
    @objc
    private func close() {
        dismiss()
    }
    
    public func dismiss() {
        dismiss(toRoot: false)
    }
    
    public func dismissToRoot() {
        dismiss(toRoot: true)
    }
    
    public func dismiss(toRoot: Bool, animated: Bool = true) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.dismiss(toRoot: toRoot, animated: animated) }
            return
        }
        
        guard let viewController = currentRootViewController else { return }
        
        // VC sta presentando un figlio
        if let presented = viewController.presentedViewController {
            presented.dismiss(animated: animated)
            return
        }
        
        // VC è presentato da un padre
        if viewController.presentingViewController != nil {
            viewController.dismiss(animated: animated)
            return
        }
        
        // VC è una navigation controller con più di un vc nello stack.
        guard let nvc = viewController as? UINavigationController else {
            preconditionFailure("Controller has never been instantiated")
        }

        DispatchQueue.main.async {
            if toRoot {
                CATransaction.begin()
                nvc.popToRootViewController(animated: animated)
                CATransaction.commit()
            } else {
                nvc.popViewController(animated: animated)
            }
        }
    }
}

// MARK: - Private Methods
private extension StandardNavigator {
    var currentRootViewController: UIViewController? {
        if let nvc = window.rootViewController as? UINavigationController {
            return nvc
        }
        
        return window.rootViewController
    }
    
    func go(to viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async { self.handleNavigation(viewController: viewController, animated: animated) }
    }
}

private extension StandardNavigator {
    func handleNavigation(viewController: UIViewController, animated: Bool = true) {
        guard let navController = self.currentRootViewController as? UINavigationController else {
            currentRootViewController?.present(viewController, animated: animated)
            return
        }
        navController.pushViewController(viewController, animated: animated)
    }
}
