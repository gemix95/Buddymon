//
//  PokemonDetailsCoordinator.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 29/01/21.
//

import Foundation

protocol PokemonDetailsViewControllerDelegate {
    func load()
}

class PokemonDetailsCoordinator: BaseCoordinator<PokemonDetailsViewController, Pokemon>, PokemonDetailsViewControllerDelegate {
    func load() {
        view.title = param.name
        
        context.messenger.loader.showLoading()
        PokemonAPIManager.shared.getPokemonDetail(id: param.id) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.context.messenger.loader.stopLoading()
                switch result {
                case .success(let pokemonDetails):
                    self.view.loadDetails(pokemon: pokemonDetails, imageUrl: self.param.imageUrl)
                case .failure(let error):
                    self.context.messenger.alert.show(message: error.localized, confirm: "Ok") { [weak self] _ in
                        self?.context.navigator.dismiss()
                    }
                }
            }
        }
    }
}
