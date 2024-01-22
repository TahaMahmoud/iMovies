//
//  SearchUseCaseTests.swift
//  
//
//  Created by Taha Mahmoud on 22/01/2024.
//

@testable import CoreDomain
@testable import MoviesDomain
import XCTest

final class SearchUseCaseTests: XCTestCase {
    var moviesRepoSuccessMock: MoviesRepoProtocol!
    var moviesRepoFailedMock: MoviesRepoProtocol!

    var searchUseCase: SearchUseCaseProtocol!

    override func setUpWithError() throws {
        moviesRepoSuccessMock = MoviesRepoSuccessMock()
        moviesRepoFailedMock = MoviesRepoFailedMock()
    }

    override func tearDownWithError() throws {
        moviesRepoSuccessMock = nil
        moviesRepoFailedMock = nil
        searchUseCase = nil
    }

    func testGetUpcomingSuccess() async throws {
        searchUseCase = SearchUseCase(repo: moviesRepoSuccessMock)

        let input = SearchUseCaseInput(page: 1, query: "Movie")

        let result = await searchUseCase.execute(input)

        // Assert
        switch result {
        case let .success(movies):
            XCTAssertEqual(movies.page, 1)
            XCTAssertEqual(movies.totalPages, 5)
            XCTAssertEqual(movies.totalResults, 100)
            XCTAssertEqual(movies.results?.count, 5)
            XCTAssertEqual(movies.results?.first?.title, "Movie 1 Name")
            XCTAssertEqual(movies.results?.first?.voteAverage, 9.5)
            XCTAssertEqual(movies.results?.first?.posterPath, "/path_to_movie_1_image.png")
        case .failure:
            // Handle the failure case
            XCTFail("Unexpected failure")
        }
    }
    
    func testGetUpcomingFailed() async throws {
        searchUseCase = SearchUseCase(repo: moviesRepoFailedMock)

        let input = SearchUseCaseInput(page: 1, query: "Movie")

        let result = await searchUseCase.execute(input)

        switch result {
        case .success:
            XCTFail("Unexpected failure")
        case .failure(let failure):
            XCTAssertEqual(failure.localizedDescription, MoviesError.unknown.localizedDescription)
        }
    }
}
