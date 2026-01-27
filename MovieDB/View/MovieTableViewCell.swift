//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import UIKit

// MARK: - Movie Table View Cell

/// Custom table view cell for displaying movie information in a list
final class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    /// Image view displaying the movie poster
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    /// Label displaying the movie title
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    /// Label displaying the movie popularity score
    @IBOutlet weak var movieScoreLabel: UILabel!
    
    /// Label displaying the movie release year
    @IBOutlet weak var movieReleaseLabel: UILabel!
    
    // MARK: - Lifecycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
