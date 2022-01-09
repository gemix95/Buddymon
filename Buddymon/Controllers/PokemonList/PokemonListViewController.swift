//
//  PokemonListViewController.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import UIKit

class PokemonListViewController: BaseViewController<PokemonListViewControllerDelegate> {
    private lazy var pokemonCollectionView: UICollectionView = coordinator.makeCollectionView(width: view.frame.width)
    private var dataSource: CollectionViewDataSource<PokemonListCollectionViewCell, Pokemon>?
    
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
    
    func updateDataSource(items: [Pokemon]) {
        dataSource = CollectionViewDataSource(items: items, configureCell: { cell, pokemon in
            cell.configure(with: pokemon)
        }, tappedCell: { [weak self] cell, pokemon in
            self?.coordinator.goToDetail(pokemon: pokemon)
        })
        
        DispatchQueue.main.async {
            self.pokemonCollectionView.dataSource = self.dataSource
            self.pokemonCollectionView.delegate = self.dataSource
        }
    }
}
