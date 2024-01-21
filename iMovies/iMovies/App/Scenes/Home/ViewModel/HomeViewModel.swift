//
//  HomeViewModel.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Combine
import Foundation
import MoviesDomain
import Stinsen
import SwiftUI

final class HomeViewModel: LoadableObject {
    @Published var state: ViewState<HomeSectionsModel> = .loading

    @RouterObject
    var router: HomeCoordinator.Router?

    var viewDidLoad: PassthroughSubject<Void, Never> = .init()
    var reload: PassthroughSubject<Void, Never> = .init()
    var movieDetails: PassthroughSubject<Int, Never> = .init()

    private var cancellables = Set<AnyCancellable>()

    let highlightsUseCase, popularUseCase, topRatedUseCase,
        nowPlayingUseCase, upcommingUseCase: any GetMoviesBaseUseCaseProtocol
    let bannerUseCase: any GetBannerUseCaseProtocol
    let isInWislistUseCase: any IsInWishListUseCaseProtocol
    let addToWishlistUseCase: any AddToWishListUseCaseProtocol
    let removeFromWishlistUseCase: any RemoveFromWishListUseCaseProtocol

    init(
        highlightsUseCase: any GetMoviesBaseUseCaseProtocol,
        popularUseCase: any GetMoviesBaseUseCaseProtocol,
        topRatedUseCase: any GetMoviesBaseUseCaseProtocol,
        nowPlayingUseCase: any GetMoviesBaseUseCaseProtocol,
        upcommingUseCase: any GetMoviesBaseUseCaseProtocol,
        bannerUseCase: any GetBannerUseCaseProtocol,
        isInWislistUseCase: any IsInWishListUseCaseProtocol,
        addToWishlistUseCase: any AddToWishListUseCaseProtocol,
        removeFromWishlistUseCase: any RemoveFromWishListUseCaseProtocol) {
        self.highlightsUseCase = highlightsUseCase
        self.popularUseCase = popularUseCase
        self.topRatedUseCase = topRatedUseCase
        self.nowPlayingUseCase = nowPlayingUseCase
        self.upcommingUseCase = upcommingUseCase

        self.bannerUseCase = bannerUseCase

        self.isInWislistUseCase = isInWislistUseCase
        self.addToWishlistUseCase = addToWishlistUseCase
        self.removeFromWishlistUseCase = removeFromWishlistUseCase

        subscribeToViewDidLoad()
        subscribeToReload()
        subscribeToMovieDetails()
    }

    func load() {
        viewDidLoad.send()
    }

    func subscribeToViewDidLoad() {
        viewDidLoad
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                Task {
                    await self.getHomeSections()
                }
            }
            .store(in: &cancellables)
    }

    func subscribeToReload() {
    }

    func subscribeToMovieDetails() {
        movieDetails
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] movieId in
                guard let self = self else { return }
                router?.route(to: \.movieDetails, movieId)
            }
            .store(in: &cancellables)
    }

    func getHomeSections() async {
        await MainActor.run {
            state = .loading
        }

        async let highlights = getHighlights()

        async let nowPlaying = getHomeSection(category: .nowPlaying)
        async let popular = getHomeSection(category: .popular)
        async let topRated = getHomeSection(category: .topRated)
        async let upcoming = getHomeSection(category: .upcoming)

        async let banner = getBanner()

        let homeSections = await HomeSectionsModel(
            highlights: highlights,
            sections: [nowPlaying, popular, topRated, upcoming],
            banner: banner)

        await MainActor.run { [weak self] in
            self?.state = .loaded(homeSections)
        }
    }
}

extension Container {
    static var homeViewModel: HomeViewModel {
        HomeViewModel(
            highlightsUseCase: Container.getHighlightsUseCase,
            popularUseCase: Container.getPopularUseCase,
            topRatedUseCase: Container.getTopRatedUseCase,
            nowPlayingUseCase: Container.getNowPlayingUseCase,
            upcommingUseCase: Container.getUpcomingUseCase,
            bannerUseCase: Container.getBannerUseCase,
            isInWislistUseCase: Container.isInWishlistUseCase,
            addToWishlistUseCase: Container.addToWishlistUseCase,
            removeFromWishlistUseCase: Container.removeFromWishlistUseCase)
    }
}
