//
//  Picture.swift
//  PraticaMock
//
//  Created by Lais Godinho on 24/07/24.
//

import Foundation

struct Picture: Decodable {
    let copyright: String?
    let date: String
    let explanation: String
    let hdurl: String?
    let title: String?
    let url: String
}

extension Date {
    func toYYYYMMDD() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
