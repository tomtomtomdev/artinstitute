//
//  MockNetworkService.swift
//  ArtInstituteChicagoTests
//
//  Created by tommy yohanes on 13/08/24.
//

import Foundation
import Combine
@testable import ArtInstituteChicago

class MockNetworkService: NetworkServiceProtocol {
    func fetchArtPieces() -> AnyPublisher<[ArtPiece], Error> {
        let artPieces = [
            ArtPiece(id: 1, title: "The Starry Night", artistTitle: "Vincent van Gogh", imageURL: nil),
            ArtPiece(id: 2, title: "The Persistence of Memory", artistTitle: "Salvador Dalí", imageURL: nil)
        ]
        
        return Just(artPieces)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
