//
//  MovieNetworking.swift
//  Roll4Show
//
//  Created by Lambda_School_Loaner_204 on 7/27/20.
//  Copyright © 2020 skysuzuki. All rights reserved.
//

import Foundation
import UIKit

class MovieNetworking {
    private let apiKey = "3a023861b8cb93e07b4fd3a2d18c344d"
    private let baseURL = URL(string: "https://api.themoviedb.org/3")!
    private let baseImageURL = URL(string: "https://image.tmdb.org/t/p")!
    //private let searchMovieURL = URL(string: "https://api.themoviedb.org/3/search/movie?")!
    //private let photoMovieURL = URL(string: "https://api.themoviedb.org/3/movie/{movie_id}/images?")!

    //https://api.themoviedb.org/3/search/movie?api_key=3a023861b8cb93e07b4fd3a2d18c344d&query=Pirates

    func searchMovie(query searchMovie: String, completion: @escaping (MovieResults?, Error?) -> Void) {

        let searchURL = baseURL.appendingPathComponent("search/movie")

        var urlComponents = URLComponents(url: searchURL, resolvingAgainstBaseURL: true)

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
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let movieResults = try jsonDecoder.decode(MovieResults.self, from: data)
                completion(movieResults, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }

    // TODO: Make more rubust to include different sizes of images - using just original in the URL
    func getMovieImages(moviePosterPath: String, completion: @escaping (UIImage?) -> Void) {

        let imageURL = baseImageURL.appendingPathComponent("original/\(moviePosterPath)")

        URLSession.shared.dataTask(with: imageURL) { data, _, _ in
            if let data = data {
                completion(UIImage(data: data))
            } else { completion(nil) }
        }.resume()
    }

}
