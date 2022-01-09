//
//  PokemonListViewControllerTests.swift
//  BuddymonTests
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import XCTest
@testable import Buddymon
@testable import CoreNetwork

class PokemonListViewControllerTests: XCTestCase {
    let navigator: Navigator = StandardNavigator()
    let messenger: Messenger = StandardMessenger()
    let networker: NetworkServices = NetworkServiceCore(networkable: Requestable())
    lazy var context = Context(navigator: navigator, messenger: messenger, networker: networker)
    
    func testCollectionView() throws {
        let param = PokemonListParam(factory: PokemonListFactory())
        let coordinator = PokemonListCoordinator(context: context, param: param)
        let controller = coordinator.start()
        
        let collection: UICollectionView = try controller.view.getView(PokemonListViewController.Identifier.pokemonCollectionView.rawValue)
        let expetation = self.expectation(description: #function)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertGreaterThan(collection.numberOfItems(inSection: 0), 100, "Number of pokemons availables")
            expetation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testPokemonResponseModel() throws {
        let expectation = expectation(description: #function)
        networker.get(listLenght: 10) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.results.count, 10)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertThrowsError(error)
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

}
