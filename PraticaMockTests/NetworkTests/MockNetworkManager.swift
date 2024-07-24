//
//  MockNetworkManager.swift
//  PraticaMockTests
//
//  Created by Lais Godinho on 24/07/24.
//

import Foundation
@testable import PraticaMock

class MockNetworkManager: NetworkManagerProtocol {
    var mockPicture: Picture?

    func requestPicture(from date: Date) async throws -> Picture {

        return mockPicture ?? Picture(copyright: nil, date: "2023-07-24", explanation: "Mock Explanation", hdurl: nil, title: "Mock Title", url: "https://mockurl.com/mock.jpg")
    }
}
