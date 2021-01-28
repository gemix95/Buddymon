//
//  TableViewDataSource.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation
import UIKit

class TableViewDataSource<CELL: UITableViewCell, T>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    public typealias CellHandler = (CELL, T) -> ()
    private var cellIdentifier : String!
    private var items: [T]!
    var configureCell: CellHandler?
    var tappedCell: CellHandler?
    
    init(cellIdentifier: String, items: [T], configureCell: CellHandler?, tappedCell: CellHandler?) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
        self.tappedCell = tappedCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        configureCell?(cell, item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.alpha = 0.3
        cell.layer.transform = CATransform3DMakeScale(0.9, 0.9, 0.9)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
            cell.contentView.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CELL
        tappedCell?(cell, self.items[indexPath.row])
    }
}
