//
//  GetPopularUseCaseTests.swift
//  
//
//  Created by Taha Mahmoud on 22/01/2024.
//

@testable import CoreDomain
@testable import MoviesDomain
import XCTest

final class GetPopularUseCaseTests: XCTestCase {
    var moviesRepoSuccessMock: MoviesRepoProtocol!
    var moviesRepoFailedMock: MoviesRepoProtocol!

    var getPopularUseCase: GetMoviesBaseUseCaseProtocol!

    override func setUpWithError() throws {
        moviesRepoSuccessMock = MoviesRepoSuccessMock()
        moviesRepoFailedMock = MoviesRepoFailedMock()
    }

    override func tearDownWithError() throws {
        moviesRepoSuccessMock = nil
        moviesRepoFailedMock = nil
        getPopularUseCase = nil
    }

    func testGetPopularSuccess() async throws {
        getPopularUseCase = GetPopularUseCase(repo: moviesRepoSuccessMock)

        let input = GetMoviesUseCaseInput(page: 1)

        let result = await getPopularUseCase.execute(input)

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
    
    func testGetPopularFailed() async throws {
        getPopularUseCase = GetPopularUseCase(repo: moviesRepoFailedMock)

        let input = GetMoviesUseCaseInput(page: 1)

        let result = await getPopularUseCase.execute(input)

        switch result {
        case .success:
            XCTFail("Unexpected failure")
        case .failure(let failure):
            XCTAssertEqual(failure.localizedDescription, MoviesError.unknown.localizedDescription)
        }
    }
}
