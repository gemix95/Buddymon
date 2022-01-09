//
//  PokemonDetailsViewController.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 29/01/21.
//

import UIKit
import SDWebImage
import CoreNetwork

class PokemonDetailsViewController: BaseViewController<PokemonDetailsViewControllerDelegate> {
    private lazy var pokemonStatCollectionView = coordinator.makeCollectionView(width: view.frame.width)
    private var dataSource: CollectionViewDataSource?
    private var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCollectionView()
        coordinator.load()
    }
    
    func loadDetails(pokemon: PokemonDetails, imageUrl: String) {
        view.backgroundColor = pokemon.types.sorted { $0.slot < $1.slot }.first?.type.name.color
        setupDataSource(items: pokemon.statList, imageUrl: imageUrl)
    }
    
    func setupDataSource(items: [EasyStatistics], imageUrl: String) {
        
        let imageSection = Section(identifier: PokemonImageCollectionViewCell.customIdentifier,
                              size: CGSize(width: view.frame.width, height: 150),
                              section: 0,
                              items: [imageUrl],
                              configureCell: { cell, imageUrl in
            if let cell = cell as? PokemonImageCollectionViewCell, let imageUrl = imageUrl as? String {
                cell.configure(with: imageUrl)
            }
        }, tappedCell: { _, _ in })
        
        let statSection = Section(identifier: PokemonStatsCollectionViewCell.customIdentifier,
                              size: CGSize(width: view.frame.width, height: 55),
                              section: 1,
                              items: items,
                              configureCell: { cell, stat in
            if let cell = cell as? PokemonStatsCollectionViewCell, let stat = stat as? EasyStatistics {
                cell.configure(with: stat)
            }
        }, tappedCell: { _, _ in })
        
        dataSource = CollectionViewDataSource(sections: [imageSection, statSection])

        DispatchQueue.main.async {
            self.pokemonStatCollectionView.dataSource = self.dataSource
            self.pokemonStatCollectionView.delegate = self.dataSource
        }
    }
    
    private func configureCollectionView() {
        pokemonStatCollectionView.backgroundColor = .clear
        pokemonStatCollectionView.accessibilityIdentifier = Identifier.statsCollectionView.rawValue
        view.addSubview(pokemonStatCollectionView)
        pokemonStatCollectionView.pinEdges(to: view)
    }
}

extension PokemonDetailsViewController {
    enum Identifier: String {
        case statsCollectionView
    }
}
