//
//  MovieDetailViewController.swift
//  Roll4Show
//
//  Created by Lambda_School_Loaner_204 on 7/28/20.
//  Copyright © 2020 skysuzuki. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet private weak var summaryTextView: UITextView!

    var movie: MovieSearchResult?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func updateViews() {
        guard let movie = movie else { return }
        self.title = movie.title
    }
}
