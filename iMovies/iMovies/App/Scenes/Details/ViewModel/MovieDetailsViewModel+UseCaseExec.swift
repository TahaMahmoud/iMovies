//
//  MovieDetailsViewModel+UseCaseExec.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import MoviesDomain

extension MovieDetailsViewModel {
    func getDetails(id: Int) async -> Result<MoviesDetailsResponse, MoviesError> {
        let input = GetDetailsUseCaseInput(movieId: id)
        return await movieDetailsUseCase.execute(input)
    }

    func getReviews(id: Int) async -> Result<ReviewsResponse, MoviesError> {
        let input = GetReviewsUseCaseInput(movieId: id)
        return await reviewsUseCase.execute(input)
    }

    func getCast(id: Int) async -> Result<CastResponse, MoviesError> {
        let input = GetCastUseCaseInput(movieId: id)
        return await castUseCase.execute(input)
    }
}

extension MovieDetailsViewModel {
    func map(movieDetails: Result<MoviesDetailsResponse, MoviesError>) -> MovieInfoModel {
        switch movieDetails {
        case let .success(movie):
            self.movieDetails = movie
            return .init(cover: URLBuilder.getFullPath(path: movie.backdropPath ?? ""),
                         name: movie.title ?? "",
                         rating: movie.voteAverage ?? 0,
                         year: movie.releaseDate ?? "",
                         duration: movie.runtime ?? 0,
                         genres: (movie.genres ?? []).map {
                             $0.name ?? ""
                         },
                         details: movie.overview ?? "",
                         url: movie.homepage ?? "")
        case .failure:
            return .init(cover: "",
                         name: "",
                         rating: 0,
                         year: "",
                         duration: 0,
                         genres: [],
                         details: "",
                         url: "")
        }
    }

    func map(reviewsResponse: Result<ReviewsResponse, MoviesError>) -> [MovieReviewModel] {
        switch reviewsResponse {
        case let .success(reviews):
            guard let reviews = reviews.results else { return [] }
            return reviews.map {
                MovieReviewModel(reviewerName: $0.authorDetails?.name ?? "",
                                 rating: $0.authorDetails?.rating ?? 0,
                                 review: $0.content ?? "",
                                 avatar: URLBuilder.getFullPath(
                                     path: $0.authorDetails?.avatarPath ?? ""))
            }
        case .failure:
            return []
        }
    }

    func map(castResponse: Result<CastResponse, MoviesError>) -> [MovieCastModel] {
        switch castResponse {
        case let .success(cast):
            guard let cast = cast.cast else { return [] }
            return cast.map {
                MovieCastModel(name: $0.originalName ?? "",
                               picture: URLBuilder.getFullPath(
                                   path: $0.profilePath ?? ""))
            }
        case .failure:
            return []
        }
    }
}
