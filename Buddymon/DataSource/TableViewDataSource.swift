//
//  TableViewDataSource.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation
import UIKit

class TableViewDataSource<CELL: UITableViewCell, T>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    public typealias ConfigureCell = (CELL, T) -> ()
    private var cellIdentifier : String!
    private var items: [T]!
    var configureCell: ConfigureCell?
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        self.configureCell?(cell, item)
        return cell
    }
}
