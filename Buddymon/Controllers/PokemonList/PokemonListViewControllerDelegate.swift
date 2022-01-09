//
//  PokemonListViewControllerDelegate.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import Foundation
import UIKit

protocol PokemonListViewControllerDelegate {
    func load()
    func goToDetail(pokemon: Pokemon)
    func makeCollectionView(width: CGFloat) -> UICollectionView 
}
