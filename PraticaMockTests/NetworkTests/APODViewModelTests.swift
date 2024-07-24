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
    var mock: MockNetworkManager!
    
    override func setUp() {
        mock = MockNetworkManager()
        sut = APODViewModel(network: mock)
    }
    
    override func tearDown() {
        mock = nil
        sut = nil
    }

    func test_APODViewModel_getPicture() async {
        let mockNetworkManager = MockNetworkManager()
                mockNetworkManager.mockPicture = Picture(copyright: nil, date: "2023-07-24", explanation: "Mock Explanation", hdurl: nil, title: "Mock Title", url: "https://mockurl.com/mock.jpg")
                let viewModel = APODViewModel(network: mockNetworkManager)

                do {
                    try await viewModel.getPicture(from: Date())
                    XCTAssertNotNil(viewModel.picture)
                    XCTAssertEqual(viewModel.picture?.title, "Mock Title")
                    XCTAssertFalse(viewModel.didFail)
                } catch {
                    XCTFail("Expected success but got failure")
                }
    }
}
