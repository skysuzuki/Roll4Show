//
//  MovieController.swift
//  Roll4Show
//
//  Created by Lambda_School_Loaner_204 on 7/27/20.
//  Copyright © 2020 skysuzuki. All rights reserved.
//

import Foundation
import UIKit

class MovieController {

    private let movieNetwork = MovieNetworking()

    private var movies: [MovieSearchResult] = []

    // Functions to access movies array
    func getMovieCount() -> Int { return movies.count }

    func getMovie(_ index: Int) -> MovieSearchResult { return movies[index] }

    // Network functions
    func searchMovie(movie: String, completion: @escaping () -> Void) {
        if !movie.isEmpty {
            movieNetwork.searchMovie(query: movie) { results, error  in
                if let error = error {
                    print(error)
                }
                if let results = results {
                    if self.movies.count > 0 { self.movies.removeAll() }
                    self.movies.append(contentsOf: results.results)
                    completion()
                }
            }
        } else {
            self.movies.removeAll()
            completion()
        }
    }

    func getMoviePoster(moviePosterPath: String, completion: @escaping (UIImage?) -> Void) {
        movieNetwork.getMovieImages(moviePosterPath: moviePosterPath) { image in
            if let image = image {
                completion(image)
            }
        }
    }
}
