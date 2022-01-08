//
//  CollectionViewDataSource.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation
import UIKit

class CollectionViewDataSource<C: UICollectionViewCell, T>: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    public typealias CellHandler = (C, T) -> ()
    
    private var items: [T]
    private var configureCell: CellHandler
    private var tappedCell: CellHandler
    private var cellHeight: CGFloat
    
    public init(items: [T], configureCell: @escaping CellHandler, tappedCell: @escaping CellHandler, cellHeight: CGFloat) {
        self.items = items
        self.configureCell = configureCell
        self.tappedCell = tappedCell
        self.cellHeight = cellHeight
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: C.customIdentifier, for: indexPath) as! C
        let item = self.items[indexPath.row]
        configureCell(cell, item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.contentView.alpha = 0.3
        cell.layer.transform = CATransform3DMakeScale(0.9, 0.9, 0.9)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
            cell.contentView.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! C
        tappedCell(cell, self.items[indexPath.row])
    }
}
