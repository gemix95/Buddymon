//
//  PokemonListTableViewCell.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import UIKit
import SDWebImage

class PokemonListTableViewCell: UITableViewCell {

    var pokemon: Pokemon? {
        didSet {
            prepareUI()
        }
    }
    
    private var pokemonNameLabel: UILabel?
    private var pokemonImgView: UIImageView?

    func prepareUI() {
        clipsToBounds = false
        selectionStyle = .none
        guard let pokemon = pokemon else { return }
        subviews.forEach({$0.removeFromSuperview()})
        let view = UIView()
        view.backgroundColor = .white
        addSubview(view)
        view.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addShadow()
        
        let stack = UIStackView(frame: frame)
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        view.addSubview(stack)
        
        stack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        pokemonImgView = UIImageView()
        if let url = URL(string: pokemon.imageUrl) {
            pokemonImgView?.sd_imageTransition = .fade
            pokemonImgView?.sd_setImage(with: url, placeholderImage: UIImage(named: "pokeball"), options: [.continueInBackground, .retryFailed], completed: nil)
        } else {
            pokemonImgView?.image = UIImage(named: "pokeball")
        }
        
        if let img = pokemonImgView {
            img.contentMode = .scaleAspectFit
            stack.addArrangedSubview(img)
            img.widthAnchor.constraint(equalToConstant: 60).isActive = true
        }
        
        pokemonNameLabel = UILabel()
        pokemonNameLabel?.text = pokemon.name
        pokemonNameLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
        if let label = pokemonNameLabel {
            stack.addArrangedSubview(label)
        }
    }

}
