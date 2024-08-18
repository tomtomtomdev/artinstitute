//
//  ArtViewModel.swift
//  ArtInstituteChicago
//
//  Created by tommy yohanes on 13/08/24.
//

import Foundation
import Combine

final class ArtViewModel: ObservableObject {
    @Published var artPieces: [ArtPiece] = []
    @Published var errorMessage: String? = nil
    
    private let fetchArtPiecesUseCase: FetchArtPiecesUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(fetchArtPiecesUseCase: FetchArtPiecesUseCase) {
        self.fetchArtPiecesUseCase = fetchArtPiecesUseCase
    }
    
    func loadArtPieces() {
        fetchArtPiecesUseCase.execute()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] model in
                self?.artPieces = model.data
            })
            .store(in: &cancellables)
    }
}
