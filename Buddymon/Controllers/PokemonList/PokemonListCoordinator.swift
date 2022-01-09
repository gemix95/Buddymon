//
//  PokemonListCoordinator.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation
import UIKit
import CoreNetwork

struct PokemonListParam {
    let factory: PokemonListFactory
}

class PokemonListCoordinator: BaseCoordinator<PokemonListViewController, PokemonListParam>, PokemonListViewControllerDelegate {
    
    func load() {
        context.messenger.loader.showLoading()
        context.networker.get(listLenght: 889) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.context.messenger.loader.stopLoading()
                switch result {
                case .success(let pokomonList):
                    self.view.setupDataSource(items: pokomonList.results)
                case .failure(let error):
                    self.context.messenger.alert.show(message: error.localized)
                }
            }
        }
    }
    
    func goToDetail(pokemon: Pokemon) {
        let param = PokemonDetailsParam(pokemon: pokemon, factory: PokemonDetailsFactory())
        let coordinator = PokemonDetailsCoordinator(context: context, param: param)
        context.navigator.navigate(to: coordinator, animated: true)
    }
    
    func makeCollectionView(width: CGFloat) -> UICollectionView {
        param.factory.makeCollectionView(width: width)
    }
}
