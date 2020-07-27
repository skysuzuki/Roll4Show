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
}

struct MovieResults: Codable {
    let page: Int
    let results: [MovieSearchResult]
}
