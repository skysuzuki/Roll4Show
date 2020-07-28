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

    var movie: MovieSearchResult?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    private func updateViews() {
        guard let movie = movie else { return }
        navTitle.title = movie.title
        //self.navigationItem.title = movie.title
        //self.navigationController?.title = movie.title
        overviewTextView.text = movie.overview
    }
}
