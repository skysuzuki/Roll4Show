//
//  MovieDetailViewController.swift
//  Roll4Show
//
//  Created by Lambda_School_Loaner_204 on 7/28/20.
//  Copyright © 2020 skysuzuki. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet private weak var overviewTextView: UITextView!
    @IBOutlet private weak var navTitle: UINavigationItem!
    @IBOutlet private weak var posterImageView: UIImageView!

    var movie: MovieSearchResult?
    var movieController: MovieController?
    private var movieImage: UIImage? {
        didSet {
            DispatchQueue.main.async {
                self.posterImageView.image = self.movieImage
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    private func updateViews() {
        guard let movie = movie else { return }
        navTitle.title = movie.title
        overviewTextView.text = movie.overview
        loadImage()
    }

    private func loadImage() {
        movieController?.getMoviePoster(moviePosterPath: (movie?.posterPath)!, completion: { image in
            self.movieImage = image
        })
    }
}
