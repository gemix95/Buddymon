//
//  PokemonDetailsViewController.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 29/01/21.
//

import UIKit
import SDWebImage

class PokemonDetailsViewController: UIViewController {
    var coordinator: PokemonDetailsCoordinator?
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pokemon = pokemon else { return }
        
        view.backgroundColor = .white
        title = pokemon.name
        
        coordinator = PokemonDetailsCoordinator(view: self)
        coordinator?.load(pokemon: pokemon)
    }
    
    func loadDetails(pokemon: PokemonDetails) {
        view.backgroundColor = pokemon.types.sorted { $0.slot < $1.slot }.first?.type.name.color
        
        let image =  UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 50, height: view.bounds.width - 50))
        image.center = view.center
        image.contentMode = .scaleAspectFit
        image.sd_imageTransition = .fade
        if let string = self.pokemon?.imageUrl, let url = URL(string: string) {
            image.sd_setImage(with: url, placeholderImage: UIImage(named: "pokeball"), options: [.continueInBackground, .retryFailed], completed: nil)
        } else {
            image.image = UIImage(named: "pokeball")
        }
        view.addSubview(image)
        
        image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        image.heightAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        image.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
    }

}
