//
//  ViewController.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import UIKit

class MovieListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var movieTableView: UITableView!
    var movieData: [MovieModel]? = []

    override func viewDidLoad() {
        super.viewDidLoad()

        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        movieData = MockData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let objMovieTable = movieTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let data = movieData?[indexPath.row]

        objMovieTable.movieTitleLabel.text = data?.title ?? ""
        objMovieTable.movieScoreLabel.text = data?.score ?? ""
        objMovieTable.movieReleaseLabel.text = data?.year ?? ""

        if let imageName = data?.image {
            objMovieTable.moviePosterImageView.image = UIImage(systemName: imageName)
        }
        
        return objMovieTable
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieData?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
        
    /*
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let headerLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
            headerLabel.text = "Movies"
            headerLabel.textAlignment = .center;
            headerLabel.textColor = .black;
            headerLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
            
            return headerLabel
        }

        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 50
        }
        
        return 0
    }
    */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let selectedMovie = movieData?[indexPath.row] else { return }
        
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else { return }
        
        detailVC.movie = selectedMovie
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
