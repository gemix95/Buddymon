//
//  PokemonListCollectionViewCell.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import UIKit
import SDWebImage
import CoreNetwork

class PokemonListCollectionViewCell: UICollectionViewCell {
    private var pokemonNameLabel = UILabel()
    private var pokemonImgView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        clipsToBounds = false
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
        
        pokemonImgView.image = UIImage(named: "pokeball")
        pokemonImgView.contentMode = .scaleAspectFit
        stack.addArrangedSubview(pokemonImgView)
        pokemonImgView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        pokemonImgView.accessibilityIdentifier = Identifiers.pokemonImage.rawValue
        
        pokemonNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        pokemonNameLabel.accessibilityIdentifier = Identifiers.pokemonName.rawValue
        stack.addArrangedSubview(pokemonNameLabel)
    }
    
    func configure(with pokemon: Pokemon) {
        let url = URL(string: pokemon.imageUrl)
        pokemonImgView.sd_imageTransition = .fade
        pokemonImgView.sd_setImage(with: url, placeholderImage: UIImage(named: "pokeball"), options: [.continueInBackground, .retryFailed], completed: nil)
        pokemonNameLabel.text = pokemon.name
    }
}

extension PokemonListCollectionViewCell {
    enum Identifiers: String {
        case pokemonName
        case pokemonImage
    }
}
