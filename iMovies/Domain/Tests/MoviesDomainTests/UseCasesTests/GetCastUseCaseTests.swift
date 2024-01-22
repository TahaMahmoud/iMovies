//
//  GetCastUseCaseTests.swift
//  
//
//  Created by Taha Mahmoud on 22/01/2024.
//

@testable import CoreDomain
@testable import MoviesDomain
import XCTest

final class GetCastUseCaseTests: XCTestCase {
    var moviesRepoSuccessMock: MoviesRepoProtocol!
    var moviesRepoFailedMock: MoviesRepoProtocol!

    var getCastUseCase: GetCastUseCase!

    override func setUpWithError() throws {
        moviesRepoSuccessMock = MoviesRepoSuccessMock()
        moviesRepoFailedMock = MoviesRepoFailedMock()
    }

    override func tearDownWithError() throws {
        moviesRepoSuccessMock = nil
        moviesRepoFailedMock = nil
        getCastUseCase = nil
    }

    func testGetReviewsSuccess() async throws {
        getCastUseCase = GetCastUseCase(repo: moviesRepoSuccessMock)

        let input = GetCastUseCaseInput(movieId: 1)

        let result = await getCastUseCase.execute(input)

        // Assert
        switch result {
        case let .success(cast):
            XCTAssertEqual(cast.id, 1)
            XCTAssertEqual(cast.cast?.count, 3)
            XCTAssertEqual(cast.cast?.first?.id, 1)
            XCTAssertEqual(cast.cast?.first?.name, "Cast 1")
            XCTAssertEqual(cast.cast?.first?.originalName, "Cast 1")
            XCTAssertEqual(cast.cast?.first?.profilePath, "/path_to_cast_1.png")
        case .failure:
            // Handle the failure case
            XCTFail("Unexpected failure")
        }
    }
    
    func testGetReviewsFailed() async throws {
        getCastUseCase = GetCastUseCase(repo: moviesRepoFailedMock)

        let input = GetCastUseCaseInput(movieId: 1)

        let result = await getCastUseCase.execute(input)

        switch result {
        case .success:
            XCTFail("Unexpected failure")
        case .failure(let failure):
            XCTAssertEqual(failure.localizedDescription, MoviesError.unknown.localizedDescription)
        }
    }
}
