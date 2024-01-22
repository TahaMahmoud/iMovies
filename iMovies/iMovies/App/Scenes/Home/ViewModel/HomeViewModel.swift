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

struct HomeViewModelSection: Identifiable {
    var id = UUID()
    var category: MovieCategory
    var useCase: any GetMoviesBaseUseCaseProtocol
}

final class HomeViewModel: LoadableObject {
    @Published var state: ViewState<HomeSectionsModel> = .loading

    @RouterObject
    var router: HomeCoordinator.Router?

    var viewDidLoad: PassthroughSubject<Void, Never> = .init()
    var reload: PassthroughSubject<Void, Never> = .init()
    var movieDetails: PassthroughSubject<Int, Never> = .init()

    private var cancellables = Set<AnyCancellable>()

    let highlightsUseCase: any GetMoviesBaseUseCaseProtocol

    let sections: [HomeViewModelSection]

    let bannerUseCase: any GetBannerUseCaseProtocol

    let isInWislistUseCase: any IsInWishListUseCaseProtocol
    let addToWishlistUseCase: any AddToWishListUseCaseProtocol
    let removeFromWishlistUseCase: any RemoveFromWishListUseCaseProtocol

    init(highlightsUseCase: any GetMoviesBaseUseCaseProtocol,
         sections: [HomeViewModelSection],
         bannerUseCase: any GetBannerUseCaseProtocol,
         isInWislistUseCase: any IsInWishListUseCaseProtocol,
         addToWishlistUseCase: any AddToWishListUseCaseProtocol,
         removeFromWishlistUseCase: any RemoveFromWishListUseCaseProtocol) {
        self.highlightsUseCase = highlightsUseCase
        self.sections = sections

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

        var result: [HomeSectionViewModel] = []
        async let highlights = getHighlights()

        await withTaskGroup(of: HomeSectionViewModel.self) { [weak self] taskGroup in
            guard let self = self else { return }
            for section in sections {
                taskGroup.addTask {
                    let homeSection = await self.getHomeSection(homeSection: section)
                    return homeSection
                }
            }

            for await homeSection in taskGroup {
                result.append(homeSection)
            }
        }

        async let banner = getBanner()

        let homeSections = await HomeSectionsModel(
            highlights: highlights,
            sections: result,
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
            sections: [
                .init(category: .nowPlaying, useCase: Container.getNowPlayingUseCase),
                .init(category: .popular, useCase: Container.getPopularUseCase),
                .init(category: .topRated, useCase: Container.getTopRatedUseCase),
                .init(category: .upcoming, useCase: Container.getUpcomingUseCase)
            ],
            bannerUseCase: Container.getBannerUseCase,
            isInWislistUseCase: Container.isInWishlistUseCase,
            addToWishlistUseCase: Container.addToWishlistUseCase,
            removeFromWishlistUseCase: Container.removeFromWishlistUseCase)
    }
}
