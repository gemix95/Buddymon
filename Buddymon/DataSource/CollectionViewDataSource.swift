//
//  CollectionViewDataSource.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation
import UIKit

public struct Section {
    public typealias CellHandler = (UICollectionViewCell, Codable) -> ()
    let identifier: String
    let size: CGSize
    let section: Int
    let items: [Codable]
    let configureCell: CellHandler
    let tappedCell: CellHandler
}

class CollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var sections: [Section]
    private var scrolled: ((CGFloat) -> Void)?
    
    public init(sections: [Section] = [], scrolled: ((CGFloat) -> Void)? = nil) {
        let sortedSection = sections.sorted(by: { $0.section < $1.section })
        self.sections = sortedSection
        self.scrolled = scrolled
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        sections[indexPath.section].size
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = sections[indexPath.section].identifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        let item = sections[indexPath.section].items[indexPath.row]
        sections[indexPath.section].configureCell(cell, item)
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
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        let item = sections[indexPath.section].items[indexPath.row]
        sections[indexPath.section].tappedCell(cell, item)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        scrolled?(contentOffsetY)
    }
}
