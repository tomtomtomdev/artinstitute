//
//  ArtPiece.swift
//  ArtInstituteChicago
//
//  Created by tommy yohanes on 13/08/24.
//

import Foundation

struct ArtPiece: Decodable, Identifiable {
    let id: Int
    let title: String
    let artistTitle: String
    let imageURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case artistTitle = "artist_title"
        case imageURL = "image_url"
    }
}
