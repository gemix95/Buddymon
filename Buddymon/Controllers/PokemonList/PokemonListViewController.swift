//
//  PokemonListViewController.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import UIKit

class PokemonListViewController: BaseViewController<PokemonListViewControllerDelegate> {
    private lazy var pokemonCollectionView: UICollectionView = coordinator.makeCollectionView(width: view.frame.width)
    private var dataSource: CollectionViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buddymon"
        configureCollectionView()
        coordinator.load()
    }
    
    private func configureCollectionView() {
        view.addSubview(pokemonCollectionView)
        pokemonCollectionView.pinEdges(to: view)
    }
    
    func setupDataSource(items: [Pokemon]) {
        let section = Section(identifier: PokemonListCollectionViewCell.customIdentifier,
                                       size: CGSize(width: view.frame.width, height: 100),
                                       section: 0,
                                       items: items,
                                       configureCell: { cell, pokemon in
            if let cell = cell as? PokemonListCollectionViewCell, let pokemon = pokemon as? Pokemon {
                cell.configure(with: pokemon)
            }
        }, tappedCell: { [weak self] cell, pokemon in
            if let pokemon = pokemon as? Pokemon {
                self?.coordinator.goToDetail(pokemon: pokemon)
            }
        })
        
        dataSource = CollectionViewDataSource(sections: [section])
        
        DispatchQueue.main.async {
            self.pokemonCollectionView.dataSource = self.dataSource
            self.pokemonCollectionView.delegate = self.dataSource
        }
    }
}
