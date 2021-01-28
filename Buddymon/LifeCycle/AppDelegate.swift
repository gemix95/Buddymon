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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let pokemonListVC = PokemonListViewController()
        let nv = UINavigationController(rootViewController: pokemonListVC)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nv
        window?.makeKeyAndVisible()
        
        return true
    }
}
