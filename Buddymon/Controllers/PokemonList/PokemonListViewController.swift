//
//  PokemonListViewController.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import UIKit

class PokemonListViewController: UIViewController {

    var coordinator: PokemonListCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinator = PokemonListCoordinator(view: self)
        coordinator?.load()
    }

}
