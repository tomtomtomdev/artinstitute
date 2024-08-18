//
//  NetworkService.swift
//  ArtInstituteChicago
//
//  Created by tommy yohanes on 13/08/24.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func fetchArtPieces() -> AnyPublisher<ApiResponse, Error>
}

final class NetworkService: NetworkServiceProtocol {
    private let baseURL = "https://api.artic.edu/api/v1"
    
    func fetchArtPieces() -> AnyPublisher<ApiResponse, Error> {
        guard let url = URL(string: "\(baseURL)/artworks") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ApiResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
