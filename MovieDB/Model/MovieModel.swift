//
//  MovieModel.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import Foundation

// MARK: - Movie Model

/// Represents a movie with all its associated information
struct MovieModel {
    
    // MARK: - Raw Properties (Clean Data)
    
    /// The title of the movie
    let title: String
    
    /// The popularity score of the movie
    let popularityScore: Double
    
    /// The release year of the movie (short format)
    let releaseYear: Int
    
    /// The SF Symbol name for the movie poster
    let imageName: String
    
    /// A brief description of the movie plot
    let plotDescription: String
    
    /// The movie's rating (e.g., 7.9)
    let rating: Double
    
    /// The detailed release date of the movie
    let releaseDate: String
    
    /// The number of votes the movie has received
    let voteCount: Int
    
    /// The genre identifier for the movie
    let genreId: Int
    
}


