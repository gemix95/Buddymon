//
//  AppDelegate.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let navigator: Navigator = StandardNavigator()
    let messenger: Messenger = StandardMessenger()
    
    private lazy var context = Context(navigator: navigator, messenger: messenger)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = navigator.start(coordinator: PokemonListCoordinator(context: context, param: Void()), animated: false)
        window?.makeKeyAndVisible()
        
        return true
    }
}
