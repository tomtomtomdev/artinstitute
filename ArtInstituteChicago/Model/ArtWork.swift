//
//  ArtWork.swift
//  ArtInstituteChicago
//
//  Created by tommy yohanes on 12/08/24.
//

import Foundation
import Combine

// Define the model conforming to Codable
struct ArtWork: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    let artist: String
    let imageURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case artist = "artist_title"
        case imageURL = "image_url"
    }
}

// Define the API response model
struct ArtWorksResponse: Codable {
    let data: [ArtWork]
    let pagination: Pagination
    
    struct Pagination: Codable {
        let totalPages: Int
        let currentPage: Int
    }
}
