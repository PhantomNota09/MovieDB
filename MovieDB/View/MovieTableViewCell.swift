//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieScoreLabel: UILabel!
    @IBOutlet weak var movieReleaseLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
