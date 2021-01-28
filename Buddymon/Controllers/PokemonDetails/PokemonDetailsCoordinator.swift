//
//  PokemonDetailsCoordinator.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 29/01/21.
//

import Foundation


protocol PokemonDetailsViewControllerDelegate {
    func load(pokemon: Pokemon)
}

class PokemonDetailsCoordinator: PokemonDetailsViewControllerDelegate {
    
    let view: PokemonDetailsViewController
    
    public init(view: PokemonDetailsViewController) {
        self.view = view
    }
    
    func load(pokemon: Pokemon) {
        view.showHud()
        PokemonAPIManager.shared.getPokemonDetail(id: pokemon.id) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.view.hideHud()
                switch result {
                case .success(let pokemonDetails):
                    print("OK")
                case .failure(let error):
                    print("error")
                }
            }
        }
    }
}
