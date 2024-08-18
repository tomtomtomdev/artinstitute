//
//  ArtInstituteChicagoTests.swift
//  ArtInstituteChicagoTests
//
//  Created by tommy yohanes on 12/08/24.
//
import XCTest
import Combine
@testable import ArtInstituteChicago

class ArtViewModelTests: XCTestCase {
    var viewModel: ArtViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        let repository = ArtRepository(networkService: MockNetworkService())
        let fetchArtPiecesUseCase = FetchArtPiecesUseCaseImpl(repository: repository)
        viewModel = ArtViewModel(fetchArtPiecesUseCase: fetchArtPiecesUseCase)
        cancellables = []
    }
    
    override func tearDown() {
        cancellables = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testLoadArtPieces() {
        let expectation = XCTestExpectation(description: "Load art pieces")
        
        viewModel.$artPieces
            .dropFirst()
            .sink { artPieces in
                XCTAssertEqual(artPieces.count, 2)
                XCTAssertEqual(artPieces.first?.title, "The Starry Night")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.loadArtPieces()
        
        wait(for: [expectation], timeout: 1.0)
    }
}
