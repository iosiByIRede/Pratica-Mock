//
//  APODViewModel.swift
//  PraticaMockTests
//
//  Created by Lais Godinho on 24/07/24.
//

import XCTest
@testable import PraticaMock

final class APODViewModelTests: XCTestCase {

    var sut: APODViewModel!
    var mock: (any NetworkManagerProtocol)!
    
    override func setUp() {
        mock = MockNetworkManager()
        sut = APODViewModel(network: mock)
    }
    
    override func tearDown() {
        mock = nil
        sut = nil
    }

    func test_APODViewModel_getPicture() async {
        do {
            try await sut.getPicture(from: Date())
            XCTAssertNotNil(sut.picture)
            XCTAssertFalse(sut.didFail)
        } catch {
            XCTFail("Expected success but got failure")
        }
    }
}
