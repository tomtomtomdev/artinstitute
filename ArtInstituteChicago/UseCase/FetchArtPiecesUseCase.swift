//
//  FetchArtPiecesUseCase.swift
//  ArtInstituteChicago
//
//  Created by tommy yohanes on 13/08/24.
//

import Foundation
import Combine

protocol FetchArtPiecesUseCase {
    func execute() -> AnyPublisher<ApiResponse, Error>
}

final class FetchArtPiecesUseCaseImpl: FetchArtPiecesUseCase {
    private let repository: ArtRepositoryProtocol
    
    init(repository: ArtRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<ApiResponse, Error> {
        return repository.fetchArtPieces()
    }
}
