//
//  MovieController.swift
//  Roll4Show
//
//  Created by Lambda_School_Loaner_204 on 7/27/20.
//  Copyright © 2020 skysuzuki. All rights reserved.
//

import Foundation

class MovieController {

    private let movieNetwork = MovieNetworking()

    var movies: [MovieSearchResult] = []

    func searchMovie(movie: String, completion: @escaping () -> Void) {
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
    }
    
}
