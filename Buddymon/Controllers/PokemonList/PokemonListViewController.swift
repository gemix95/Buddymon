//
//  PokemonListViewController.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import UIKit

class PokemonListViewController: BaseViewController<PokemonListViewControllerDelegate> {
    private var pokemonListTableView: UITableView?
    private var dataSource: TableViewDataSource<PokemonListTableViewCell, Pokemon>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buddymon"
        configureTableView()
        coordinator.load()
    }
    
    private func configureTableView() {
        let tableView = UITableView(frame: view.frame)
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PokemonListTableViewCell.self, forCellReuseIdentifier: PokemonListTableViewCell.customIdentifier)
        tableView.separatorStyle = .none
        pokemonListTableView = tableView
    }
    
    func updateDataSource(items: [Pokemon]) {
        dataSource = TableViewDataSource(cellIdentifier: PokemonListTableViewCell.customIdentifier, items: items, cellHeight: 100,
                                         configureCell: { (cell, pokemon) in
                                            cell.pokemon = pokemon
                                         },
                                         tappedCell: { [weak self] (cell, pokemon) in
                                            self?.coordinator.goToDetail(pokemon: pokemon)
                                         })
        
        DispatchQueue.main.async {
            self.pokemonListTableView?.dataSource = self.dataSource
            self.pokemonListTableView?.delegate = self.dataSource
            self.pokemonListTableView?.reloadData()
        }
    }
}
