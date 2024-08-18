//
//  ArtRepository.swift
//  ArtInstituteChicago
//
//  Created by tommy yohanes on 13/08/24.
//

import Foundation
import Combine

protocol ArtRepositoryProtocol {
    func fetchArtPieces() -> AnyPublisher<ApiResponse, Error>
}

final class ArtRepository: ArtRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchArtPieces() -> AnyPublisher<ApiResponse, Error> {
         networkService.fetchArtPieces()
    }
}
