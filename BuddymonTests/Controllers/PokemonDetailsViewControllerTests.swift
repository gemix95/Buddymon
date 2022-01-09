//
//  PokemonDetailsViewControllerTests.swift
//  BuddymonTests
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import XCTest
@testable import Buddymon
@testable import CoreNetwork

class PokemonDetailsViewControllerTests: XCTestCase {
    let navigator: Navigator = StandardNavigator()
    let messenger: Messenger = StandardMessenger()
    let networker: NetworkServices = NetworkServiceCore(networkable: Requestable())
    lazy var context = Context(navigator: navigator, messenger: messenger, networker: networker)
    
    func testCollectionView() throws {
        let param = PokemonDetailsParam(pokemon: Pokemon.random, factory: PokemonDetailsFactory())
        let coordinator = PokemonDetailsCoordinator(context: context, param: param)
        let controller = coordinator.start()
        XCTAssertEqual(controller.view.backgroundColor, .white)
        
        let collection: UICollectionView = try controller.view.getView(PokemonDetailsViewController.Identifier.statsCollectionView.rawValue)
        let expetation = self.expectation(description: #function)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertEqual(controller.view.backgroundColor, .electric)
            XCTAssertEqual(collection.numberOfSections, 2)
            expetation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPokemonStatsModel() throws {
        let expectation = expectation(description: #function)
        networker.getPokemonDetail(id: "25") { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.types.first?.type.name, "electric")
                expectation.fulfill()
            case .failure(let error):
                XCTAssertThrowsError(error)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
