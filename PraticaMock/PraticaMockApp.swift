//
//  PraticaMockApp.swift
//  PraticaMock
//
//  Created by Lais Godinho on 24/07/24.
//

import SwiftUI

@main
struct PraticaMockApp: App {
    
    var viewModel = APODViewModel(network: NetworkManager.shared)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
