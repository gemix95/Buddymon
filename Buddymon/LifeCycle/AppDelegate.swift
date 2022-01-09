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
    let networker: NetworkServices = NetworkServiceCore(networkable: Requestable())
    
    private lazy var context = Context(navigator: navigator, messenger: messenger, networker: networker)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let param = PokemonListParam(factory: PokemonListFactory())
        window = navigator.start(coordinator: PokemonListCoordinator(context: context, param: param), animated: false)
        window?.makeKeyAndVisible()
        
        return true
    }
}
