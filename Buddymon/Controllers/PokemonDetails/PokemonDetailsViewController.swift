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
    private var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        pokemonStatCollectionView.backgroundColor = .clear
        
        coordinator.load()
    }
    
    func configureMainImage(pokemon: PokemonDetails, imageUrl: String) {
        view.backgroundColor = pokemon.types.sorted { $0.slot < $1.slot }.first?.type.name.color
        
        imageView =  UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 50, height: view.bounds.width - 50))
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        imageView.sd_imageTransition = .fade
        imageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "pokeball"), options: [.continueInBackground, .retryFailed], completed: nil)
        view.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func loadDetails(pokemon: PokemonDetails, imageUrl: String) {
        configureColleetionView(viewToAnchor: imageView)
        updateDataSource(items: pokemon.statList)
    }

    private func configureColleetionView(viewToAnchor: UIView) {
        view.addSubview(pokemonStatCollectionView)
        pokemonStatCollectionView.topAnchor.constraint(equalTo: viewToAnchor.bottomAnchor).isActive = true
        pokemonStatCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pokemonStatCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pokemonStatCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pokemonStatCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateDataSource(items: [EasyStatistics]) {
        dataSource = CollectionViewDataSource(items: items,
                                              configureCell: { cell, stat in
                                                    cell.configure(with: stat)
                                              },
                                              tappedCell: { _, _ in })
        
        DispatchQueue.main.async {
            self.pokemonStatCollectionView.dataSource = self.dataSource
            self.pokemonStatCollectionView.delegate = self.dataSource
        }
    }
}
