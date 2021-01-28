//
//  PokemonListCoordinator.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation

protocol PokemonListViewControllerDelegate {
    func load()
}

class PokemonListCoordinator: PokemonListViewControllerDelegate {
    
    let view: PokemonListViewController
    
    public init(view: PokemonListViewController) {
        self.view = view
    }
    
    func load() {
        view.showHud()
        PokemonAPIManager.shared.get(listLenght: 809) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.view.hideHud()
                switch result {
                case .success(let pokomonList):
                    self.view.updateDataSource(items: pokomonList)
                case .failure(let error):
                    print(error.localized)
                }
            }
        }
    }
}
