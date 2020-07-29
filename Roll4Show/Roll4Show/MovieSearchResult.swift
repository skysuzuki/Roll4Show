//
//  MovieSearchResult.swift
//  Roll4Show
//
//  Created by Lambda_School_Loaner_204 on 7/27/20.
//  Copyright © 2020 skysuzuki. All rights reserved.
//

import Foundation

struct MovieSearchResult: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let posterPath: String?
}

struct MovieImageResult: Codable {
    let posters: [MoviePoster]

    struct MoviePoster: Codable {
        let filePath: String?

        enum CodingKeys: String, CodingKey {
            case filePath = "file_path"
        }
    }
}

struct MovieResults: Codable {
    let results: [MovieSearchResult]
}
