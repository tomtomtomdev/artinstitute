//
//  SwiftUIView.swift
//  ArtInstituteChicago
//
//  Created by tommy yohanes on 13/08/24.
//

import SwiftUI

struct ArtListView: View {
    @StateObject private var viewModel: ArtViewModel
    
    init(viewModel: ArtViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.artPieces) { artPiece in
                Text(artPiece.title)
            }
            .onAppear {
                viewModel.loadArtPieces()
            }
            .navigationTitle("Art Pieces")
        }
    }
}
