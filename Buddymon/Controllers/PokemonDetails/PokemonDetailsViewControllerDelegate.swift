//
//  PokemonDetailsViewControllerDelegate.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import Foundation
import UIKit

protocol PokemonDetailsViewControllerDelegate {
    func load()
    func makeCollectionView(width: CGFloat) -> UICollectionView
}
