//
//  APODViewModel.swift
//  PraticaMock
//
//  Created by Lais Godinho on 25/07/24.
//

import Foundation

class APODViewModel: ObservableObject {
    var network: any NetworkManagerProtocol
    @Published var picture: Picture? = nil
    @Published var didFail = false
    
    init(network: any NetworkManagerProtocol) {
        self.network = network
    }
    
    @MainActor
    func getPicture(from date: Date) async throws {
        do {
            picture = try await network.requestPicture(from: date)
        } catch {
            print(error)
            didFail = true
        }
    }
}
