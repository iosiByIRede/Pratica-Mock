//
//  NetworkManager.swift
//  PraticaMock
//
//  Created by Lais Godinho on 25/07/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func requestPicture(from date: Date) async throws -> Picture
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared: any NetworkManagerProtocol = NetworkManager()
    private let base_url = "https://api.nasa.gov/planetary/apod"
    private let token = "aU9Gy13XDaPy98OUBPPsOqFdG5CFPts9JAvGi5jQ"
    private var url_request: String? = nil
    
    private init() {}
    
    func requestPicture(from date: Date) async throws -> Picture {
        let dateString = date.toYYYYMMDD()
        
        let url = buildURL(date: dateString)
        
        guard let url = URL(string: url) else {
            fatalError()
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(Picture.self, from: data)
    }
    
    private func buildURL(date: String? = nil) -> String {
        var url = base_url + "?api_key=" + token
        
        if date != nil {
            url += "&date=" + date!
        }
        
        return url
    }
}
