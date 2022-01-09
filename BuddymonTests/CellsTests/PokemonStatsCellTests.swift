//
//  PokemonStatsCellTests.swift
//  BuddymonTests
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import XCTest
@testable import Buddymon
@testable import CoreNetwork

class PokemonStatsCellTests: XCTestCase {
    
    func testUI() throws {
        let cell = PokemonStatsCollectionViewCell()
        let nameLabel: UILabel = try cell.getView(PokemonStatsCollectionViewCell.Identifiers.nameLabel.rawValue)
        let valueLabel: UILabel = try cell.getView(PokemonStatsCollectionViewCell.Identifiers.valueLabel.rawValue)
        
        XCTAssertEqual(nameLabel.text, nil)
        XCTAssertEqual(valueLabel.text, nil)
    }
    
    func testConfigure() throws {
        let cell = PokemonStatsCollectionViewCell()
        let nameLabel: UILabel = try cell.getView(PokemonStatsCollectionViewCell.Identifiers.nameLabel.rawValue)
        let valueLabel: UILabel = try cell.getView(PokemonStatsCollectionViewCell.Identifiers.valueLabel.rawValue)
        
        cell.configure(with: EasyStatistics.random)
        XCTAssertEqual(nameLabel.text, "Color")
        XCTAssertEqual(valueLabel.text, "Yellow")
    }
}
