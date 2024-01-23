//
//  GetReviewsUseCaseTests.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

@testable import CoreDomain
@testable import MoviesDomain
import XCTest

final class GetReviewsUseCaseTests: XCTestCase {
    var moviesRepoSuccessMock: MoviesRepoProtocol!
    var moviesRepoFailedMock: MoviesRepoProtocol!

    var getReviewsUseCase: GetReviewsUseCaseProtocol!

    override func setUpWithError() throws {
        moviesRepoSuccessMock = MoviesRepoSuccessMock()
        moviesRepoFailedMock = MoviesRepoFailedMock()
    }

    override func tearDownWithError() throws {
        moviesRepoSuccessMock = nil
        moviesRepoFailedMock = nil
        getReviewsUseCase = nil
    }

    func testGetReviewsSuccess() async throws {
        getReviewsUseCase = GetReviewsUseCase(repo: moviesRepoSuccessMock)

        let input = GetReviewsUseCaseInput(movieId: 1)

        let result = await getReviewsUseCase.execute(input)

        // Assert
        switch result {
        case let .success(reviews):
            XCTAssertEqual(reviews.id, 1)
            XCTAssertEqual(reviews.page, 1)
            XCTAssertEqual(reviews.totalPages, 5)
            XCTAssertEqual(reviews.totalResults, 100)
            XCTAssertEqual(reviews.results?.count, 3)
            XCTAssertEqual(reviews.results?.first?.author, "Author 1 Name")
            XCTAssertEqual(reviews.results?.first?.content, "Author 1 Review")
            XCTAssertEqual(reviews.results?.first?.authorDetails?.rating, 7)
            XCTAssertEqual(reviews.results?.first?.authorDetails?.avatarPath, "/path_to_author_1.png")
        case .failure:
            // Handle the failure case
            XCTFail("Unexpected failure")
        }
    }

    func testGetReviewsFailed() async throws {
        getReviewsUseCase = GetReviewsUseCase(repo: moviesRepoFailedMock)

        let input = GetReviewsUseCaseInput(movieId: 1)

        let result = await getReviewsUseCase.execute(input)

        switch result {
        case .success:
            XCTFail("Unexpected failure")
        case let .failure(failure):
            XCTAssertEqual(failure.localizedDescription, MoviesError.unknown.localizedDescription)
        }
    }
}
