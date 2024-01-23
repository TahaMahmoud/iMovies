//
//  GetBannerUseCaseTests.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

@testable import CoreDomain
@testable import MoviesDomain
import XCTest

final class GetBannerUseCaseTests: XCTestCase {
    var bannerRepoSuccessMock: BannerRepoProtocol!
    var bannerRepoFailedMock: BannerRepoProtocol!

    var getBannerUseCase: GetBannerUseCase!

    override func setUpWithError() throws {
        bannerRepoSuccessMock = BannerRepoSuccessMock()
        bannerRepoFailedMock = BannerRepoFailedMock()
    }

    override func tearDownWithError() throws {
        bannerRepoSuccessMock = nil
        bannerRepoFailedMock = nil
        getBannerUseCase = nil
    }

    func testGetReviewsSuccess() async throws {
        getBannerUseCase = GetBannerUseCase(repo: bannerRepoSuccessMock)

        let result = await getBannerUseCase.execute()

        // Assert
        switch result {
        case let .success(banner):
            XCTAssertEqual(banner.title, "Banner Title")
            XCTAssertEqual(banner.subTitle, "Banner Subtitle")
            XCTAssertEqual(banner.image, "/banner_path.png")
        case .failure:
            // Handle the failure case
            XCTFail("Unexpected failure")
        }
    }

    func testGetReviewsFailed() async throws {
        getBannerUseCase = GetBannerUseCase(repo: bannerRepoFailedMock)

        let result = await getBannerUseCase.execute()

        switch result {
        case .success:
            XCTFail("Unexpected failure")
        case let .failure(failure):
            XCTAssertEqual(failure.localizedDescription, MoviesError.unknown.localizedDescription)
        }
    }
}
