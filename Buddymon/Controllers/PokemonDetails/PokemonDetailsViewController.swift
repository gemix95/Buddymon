//
//  PokemonDetailsViewController.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 29/01/21.
//

import UIKit
import SDWebImage

class PokemonDetailsViewController: BaseViewController<PokemonDetailsViewControllerDelegate> {
    private var pokemonStatListTableView: UITableView?
    private var dataSource: TableViewDataSource<UITableViewCell, EasyStatistics>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        coordinator.load()
    }
    
    func loadDetails(pokemon: PokemonDetails, imageUrl: String) {
        view.backgroundColor = pokemon.types.sorted { $0.slot < $1.slot }.first?.type.name.color
        
        let image =  UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 50, height: view.bounds.width - 50))
        image.center = view.center
        image.contentMode = .scaleAspectFit
        image.sd_imageTransition = .fade
        image.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "pokeball"), options: [.continueInBackground, .retryFailed], completed: nil)
        view.addSubview(image)
        
        image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        image.heightAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        image.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        configureTableView(viewToAnchor: image)
        updateDataSource(items: pokemon.statList)
    }

    private func configureTableView(viewToAnchor: UIView) {
        let tableView = UITableView(frame: view.frame)
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: viewToAnchor.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.customIdentifier)
        tableView.separatorStyle = .none
        pokemonStatListTableView = tableView
    }
    
    func updateDataSource(items: [EasyStatistics]) {
        dataSource = TableViewDataSource(cellIdentifier: UITableViewCell.customIdentifier, items: items, cellHeight: 55,
                                         configureCell: { (cell, stat) in
                                            cell.selectionStyle = .none
                                            cell.textLabel?.text = "\(stat.name): \(stat.value)"
                                            cell.backgroundColor = .clear
                                            let view = UIView()
                                            view.tag = 123
                                            view.backgroundColor = .white
                                            cell.subviews.forEach({if $0.tag == 123 { $0.removeFromSuperview() }})
                                            cell.insertSubview(view, at: 0)
                                            view.topAnchor.constraint(equalTo: cell.topAnchor, constant: 5).isActive = true
                                            view.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -5).isActive = true
                                            view.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10).isActive = true
                                            view.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10).isActive = true
                                            view.translatesAutoresizingMaskIntoConstraints = false
                                            view.addShadow(round: 45/2)
                                         },
                                         tappedCell: { (_, _) in })
        
        DispatchQueue.main.async {
            self.pokemonStatListTableView?.dataSource = self.dataSource
            self.pokemonStatListTableView?.delegate = self.dataSource
            self.pokemonStatListTableView?.reloadData()
        }
    }
}
