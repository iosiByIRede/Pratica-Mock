//
//  Picture.swift
//  PraticaMock
//
//  Created by Lais Godinho on 24/07/24.
//

import Foundation

class Network: ObservableObject {
    @Published var picture: Picture? = nil
    
    @MainActor
    func getPicture() async throws {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=aU9Gy13XDaPy98OUBPPsOqFdG5CFPts9JAvGi5jQ") else {
            fatalError()
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        picture = try JSONDecoder().decode(Picture.self, from: data)
    }
}

struct Picture: Decodable {
    let copyright: String?
    let date: String
    let explanation: String
    let hdurl: String
    let media_type: String
    let service_version: String
    let title: String
    let url: String
}
