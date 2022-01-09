//
//  PokemonDetailsCoordinator.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 29/01/21.
//

import Foundation
import UIKit

struct PokemonDetailsParam {
    let pokemon: Pokemon
    let factory: PokemonDetailsFactory
}

class PokemonDetailsCoordinator: BaseCoordinator<PokemonDetailsViewController, PokemonDetailsParam>, PokemonDetailsViewControllerDelegate {
    func load() {
        view.title = param.pokemon.name
        
        context.messenger.loader.showLoading()
        context.networker.getPokemonDetail(id: param.pokemon.id) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.context.messenger.loader.stopLoading()
                switch result {
                case .success(let pokemonDetails):
                    self.view.configureMainImage(pokemon: pokemonDetails, imageUrl: self.param.pokemon.imageUrl)
                    self.view.loadDetails(pokemon: pokemonDetails, imageUrl: self.param.pokemon.imageUrl)
                case .failure(let error):
                    self.context.messenger.alert.show(message: error.localized, confirm: "Ok") { [weak self] _ in
                        self?.context.navigator.dismiss()
                    }
                }
            }
        }
    }
    
    func makeCollectionView(width: CGFloat) -> UICollectionView {
        param.factory.makeCollectionView(width: width)
    }
}
