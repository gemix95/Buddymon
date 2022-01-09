//
//  PokemonListCellTests.swift
//  BuddymonTests
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import XCTest
@testable import Buddymon
@testable import CoreNetwork

class PokemonListCellTests: XCTestCase {

    func testUI() throws {
        let cell = PokemonListCollectionViewCell()
        let label: UILabel = try cell.getView(PokemonListCollectionViewCell.Identifiers.pokemonName.rawValue)
        let imageView: UIImageView = try cell.getView(PokemonListCollectionViewCell.Identifiers.pokemonImage.rawValue)
        
        XCTAssertEqual(label.text, nil)
        XCTAssertEqual(imageView.image, UIImage(named: "pokeball"))
    }
    
    func testConfigure() throws {
        let cell = PokemonListCollectionViewCell()
        let label: UILabel = try cell.getView(PokemonListCollectionViewCell.Identifiers.pokemonName.rawValue)
        let imageView: UIImageView = try cell.getView(PokemonListCollectionViewCell.Identifiers.pokemonImage.rawValue)
        
        cell.configure(with: Pokemon.random)
        XCTAssertEqual(label.text, "Pikachu")
        XCTAssertNotNil(imageView.image)
        let expectation = self.expectation(description: #function)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotEqual(imageView.image, UIImage(named: "pokeball"))
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
