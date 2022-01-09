//
//  PokemonListFactory.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import Foundation
import UIKit

class PokemonListFactory {
    func makeCollectionView(width: CGFloat) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: 100)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(PokemonListCollectionViewCell.self, forCellWithReuseIdentifier: PokemonListCollectionViewCell.customIdentifier)
        return collectionView
    }
}
