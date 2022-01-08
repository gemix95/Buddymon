//
//  PokemonListCoordinator.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation

protocol PokemonListViewControllerDelegate {
    func load()
    func goToDetail(pokemon: Pokemon)
}

class PokemonListCoordinator: BaseCoordinator<PokemonListViewController, Void>, PokemonListViewControllerDelegate {
    
    func load() {
        context.messenger.loader.showLoading()
        PokemonAPIManager.shared.get(listLenght: 809) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.context.messenger.loader.stopLoading()
                switch result {
                case .success(let pokomonList):
                    self.view.updateDataSource(items: pokomonList)
                case .failure(let error):
                    self.context.messenger.alert.show(message: error.localized)
                }
            }
        }
    }
    
    func goToDetail(pokemon: Pokemon) {
        let coordinator = PokemonDetailsCoordinator(context: context, param: pokemon)
        context.navigator.navigate(to: coordinator, animated: true)
    }
}
