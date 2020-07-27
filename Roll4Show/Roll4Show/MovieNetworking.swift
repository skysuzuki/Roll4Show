//
//  MovieNetworking.swift
//  Roll4Show
//
//  Created by Lambda_School_Loaner_204 on 7/27/20.
//  Copyright © 2020 skysuzuki. All rights reserved.
//

import Foundation

class MovieNetworking {
    private let apiKey = "3a023861b8cb93e07b4fd3a2d18c344d"
    private let searchMovieURL = URL(string: "https://api.themoviedb.org/3/search/movie?")!

    //https://api.themoviedb.org/3/search/movie?api_key=3a023861b8cb93e07b4fd3a2d18c344d&query=Pirates

    func searchMovie(query searchMovie: String, completion: @escaping (MovieResults?, Error?) -> Void) {

        var urlComponents = URLComponents(url: searchMovieURL, resolvingAgainstBaseURL: true)

        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "query", value: searchMovie)
        ]

        guard let requestURL = urlComponents?.url else {
            completion(nil, nil)
            return
        }

        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil, error)
                return
            }

            guard let data = data else {
                return
            }

            let jsonDecoder = JSONDecoder()
            do {
                let movieResults = try jsonDecoder.decode(MovieResults.self, from: data)
                completion(movieResults, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()

    }

}
