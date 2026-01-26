//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieScoreLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieReleaseYearLabel: UILabel!
    @IBOutlet weak var movieVoteLabel: UILabel!
    @IBOutlet weak var movieGenreIdLabel: UILabel!
    
    var movie: MovieModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        guard let movie = movie else { return }
        
        movieTitleLabel.text = movie.title
        movieDescriptionLabel.text = movie.description
        movieScoreLabel.text = movie.score
        movieRatingLabel.text = movie.rating
        movieReleaseYearLabel.text = movie.detailedYear
        movieVoteLabel.text = movie.voteCount
        movieGenreIdLabel.text = movie.genreId
        
        if let imageName = movie.image {
            movieImageView.image = UIImage(systemName: imageName)
        }
    }
}
