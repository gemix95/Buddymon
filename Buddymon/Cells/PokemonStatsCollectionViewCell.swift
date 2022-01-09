//
//  PokemonStatsCollectionViewCell.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import UIKit
import CoreNetwork

class PokemonStatsCollectionViewCell: UICollectionViewCell {
    private var statNameLabel = UILabel()
    private var statValueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.accessibilityIdentifier = Identifiers.statsCell.rawValue
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        clipsToBounds = false
        let view = UIView()
        view.backgroundColor = .white
        addSubview(view)
        view.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addShadow(round: 45/2)
        
        let stack = UIStackView(frame: frame)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        view.addSubview(stack)
        
        stack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(statNameLabel)
        stack.addArrangedSubview(statValueLabel)
        
        statNameLabel.accessibilityIdentifier = Identifiers.nameLabel.rawValue
        statNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        statNameLabel.textAlignment = .left
        statValueLabel.accessibilityIdentifier = Identifiers.valueLabel.rawValue
        statValueLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        statValueLabel.textAlignment = .right
    }
    
    func configure(with stat: EasyStatistics) {
        statNameLabel.text = stat.name
        statValueLabel.text = stat.value
    }
}

extension PokemonStatsCollectionViewCell {
    enum Identifiers: String {
        case nameLabel
        case valueLabel
        case statsCell
    }
}
