//
//  PokemonDetailsViewController.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 29/01/21.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    var coordinator: PokemonDetailsCoordinator?
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pokemon = pokemon else { return }
        
        view.backgroundColor = .white
        title = pokemon.name
        
        coordinator = PokemonDetailsCoordinator(view: self)
        coordinator?.load(pokemon: pokemon)
    }
    
    func loadDetails(pokemon: PokemonDetails) {
        view.backgroundColor = pokemon.types.sorted { $0.slot < $1.slot }.first?.type.name.color
    }

}
