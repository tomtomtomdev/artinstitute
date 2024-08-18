//
//  ArtService.swift
//  ArtInstituteChicago
//
//  Created by tommy yohanes on 12/08/24.
//

import Foundation
import Combine

protocol ArtService {
    func fetchArtWorks(page: Int, query: String?) -> AnyPublisher<ArtWorksResponse, Error>
}

class ArtServiceImpl: ArtService {
    private let baseURL = "https://api.artic.edu/api/v1/artworks"
    
    func fetchArtWorks(page: Int, query: String?) -> AnyPublisher<ArtWorksResponse, Error> {
        var components = URLComponents(string: baseURL)!
        var queryItems = [URLQueryItem(name: "page", value: "\(page)")]
        if let query = query, !query.isEmpty {
            queryItems.append(URLQueryItem(name: "query", value: query))
        }
        components.queryItems = queryItems
        
        let request = URLRequest(url: components.url!)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: ArtWorksResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
