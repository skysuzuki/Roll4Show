//
//  SearchMovieTableViewController.swift
//  Roll4Show
//
//  Created by Lambda_School_Loaner_204 on 7/27/20.
//  Copyright © 2020 skysuzuki. All rights reserved.
//

import UIKit

class SearchMovieTableViewController: UITableViewController {

    @IBOutlet weak var searchMovie: UISearchBar!

    let movieController = MovieController()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchMovie.delegate = self
    }

    private func searchMovie(_ movie: String) {
        movieController.searchMovie(movie: movie) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController.getMovieCount()
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)

        // Configure the cell...
        let movie = movieController.getMovie(indexPath.row)
        cell.textLabel?.text = movie.title

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // MovieDetailModalSegue
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

extension SearchMovieTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchMovie(searchText)
    }
}
