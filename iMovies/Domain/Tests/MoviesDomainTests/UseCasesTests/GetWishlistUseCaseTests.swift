//
//  GetWishlistUseCaseTests.swift
//
//
//  Created by Taha Mahmoud on 23/01/2024.
//

@testable import CoreDomain
@testable import MoviesDomain
import XCTest

final class GetWishlistUseCaseTests: XCTestCase {
    var wishlistRepoSuccessMock: WishListRepoProtocol!
    var wishlistRepoFailedMock: WishListRepoProtocol!

    var wishlistUseCase: GetWishListUseCase!

    override func setUpWithError() throws {
        wishlistRepoSuccessMock = WishlistRepoSuccessMock()
        wishlistRepoFailedMock = WishlistRepoFailedMock()
    }

    override func tearDownWithError() throws {
        wishlistRepoSuccessMock = nil
        wishlistRepoFailedMock = nil
        wishlistUseCase = nil
    }

    func testGetUpcomingSuccess() async throws {
        wishlistUseCase = GetWishListUseCase(repo: wishlistRepoSuccessMock)
        let result = await wishlistUseCase.execute()

        // Assert
        switch result {
        case let .success(wishlist):
            XCTAssertEqual(wishlist.count, 3)
            XCTAssertEqual(wishlist.first?.title, "Movie 1")
            XCTAssertEqual(wishlist.first?.voteAverage, 9.5)
            XCTAssertEqual(wishlist.first?.genres.count, 3)
            XCTAssertEqual(wishlist.first?.genres.first, 1)
            XCTAssertEqual(wishlist.first?.poster, "/path_to_movie_1.png")
        case .failure:
            // Handle the failure case
            XCTFail("Unexpected failure")
        }
    }

    func testGetUpcomingFailed() async throws {
        wishlistUseCase = GetWishListUseCase(repo: wishlistRepoFailedMock)

        let result = await wishlistUseCase.execute()

        switch result {
        case .success:
            XCTFail("Unexpected failure")
        case let .failure(failure):
            XCTAssertEqual(failure.localizedDescription, MoviesError.unknown.localizedDescription)
        }
    }
}
