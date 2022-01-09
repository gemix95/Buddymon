//
//  PokemonDetailsViewController.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 29/01/21.
//

import UIKit
import SDWebImage

class PokemonDetailsViewController: BaseViewController<PokemonDetailsViewControllerDelegate> {
    private lazy var pokemonStatCollectionView = coordinator.makeCollectionView(width: view.frame.width)
    private var dataSource: CollectionViewDataSource<PokemonStatsCollectionViewCell, EasyStatistics>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        coordinator.load()
    }
    
    func loadDetails(pokemon: PokemonDetails, imageUrl: String) {
        view.backgroundColor = pokemon.types.sorted { $0.slot < $1.slot }.first?.type.name.color
        
        let image =  UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 50, height: view.bounds.width - 50))
        image.center = view.center
        image.contentMode = .scaleAspectFit
        image.sd_imageTransition = .fade
        image.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "pokeball"), options: [.continueInBackground, .retryFailed], completed: nil)
        view.addSubview(image)
        
        image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        image.heightAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        image.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        configureTableView(viewToAnchor: image)
        updateDataSource(items: pokemon.statList)
    }

    private func configureTableView(viewToAnchor: UIView) {
        pokemonStatCollectionView.backgroundColor = .clear
        view.addSubview(pokemonStatCollectionView)
        pokemonStatCollectionView.topAnchor.constraint(equalTo: viewToAnchor.bottomAnchor).isActive = true
        pokemonStatCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pokemonStatCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pokemonStatCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pokemonStatCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateDataSource(items: [EasyStatistics]) {
        dataSource = CollectionViewDataSource(items: items,
                                              configureCell: { (cell, stat) in
            cell.configure(with: stat)
        },
                                              tappedCell: { (_, _) in })
        
        DispatchQueue.main.async {
            self.pokemonStatCollectionView.dataSource = self.dataSource
            self.pokemonStatCollectionView.delegate = self.dataSource
        }
    }
}
