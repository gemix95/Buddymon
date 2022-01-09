//
//  PokemonImageCollectionViewCell.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import UIKit
import SDWebImage

class PokemonImageCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.accessibilityIdentifier = Identifier.imageCell.rawValue
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.pinEdges(to: self)
    }
    
    func configure(with imageURL: String) {
        imageView.sd_imageTransition = .fade
        imageView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "pokeball"), options: [.continueInBackground, .retryFailed], completed: nil)
    }
}

extension PokemonImageCollectionViewCell {
    enum Identifier: String {
        case imageCell
    }
}
