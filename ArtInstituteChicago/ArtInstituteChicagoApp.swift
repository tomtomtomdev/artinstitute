//
//  ArtInstituteChicagoApp.swift
//  ArtInstituteChicago
//
//  Created by tommy yohanes on 12/08/24.
//

import SwiftUI

@main
struct ArtInstituteChicagoApp: App {
    var body: some Scene {
        WindowGroup {
            let networkService = NetworkService()
            let repository = ArtRepository(networkService: networkService)
            let fetchArtPiecesUseCase = FetchArtPiecesUseCaseImpl(repository: repository)
            let viewModel = ArtViewModel(fetchArtPiecesUseCase: fetchArtPiecesUseCase)
            ArtListView(viewModel: viewModel)
        }
    }
}
