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
    
    // MARK: - Computed Properties (Formatted Display)
    
    /// Formatted title for display
    var displayTitle: String {
        return "Title: \(title)"
    }
    
    /// Formatted popularity score for display
    var displayScore: String {
        return "Popularity Score: \(popularityScore)"
    }
    
    /// Formatted release year for display (short)
    var displayYear: String {
        return "Release Year: \(releaseYear)"
    }
    
    /// Formatted rating for display
    var displayRating: String {
        return "Rating: \(rating)/10"
    }
    
    /// Formatted release date for display (detailed)
    var displayReleaseDate: String {
        return "Release Date: \(releaseDate)"
    }
    
    /// Formatted vote count for display
    var displayVoteCount: String {
        return "Vote Count: \(voteCount.formatted())"
    }
    
    /// Formatted genre ID for display
    var displayGenreId: String {
        return "Genre ID: \(genreId)"
    }
    
    // MARK: - Static Formatting Functions
    
    /// Formats a title with prefix
    static func formatTitle(_ title: String) -> String {
        return "Title: \(title)"
    }
    
    /// Formats a popularity score
    static func formatPopularityScore(_ score: Double) -> String {
        return "Popularity Score: \(score)"
    }
    
    /// Formats a rating value
    static func formatRating(_ rating: Double) -> String {
        return "Rating: \(rating)/10"
    }
    
    /// Formats vote count with thousands separator
    static func formatVoteCount(_ count: Int) -> String {
        return "Vote Count: \(count.formatted())"
    }
}

// MARK: - Mock Data Generator

/// Generates mock movie data for testing and development purposes
func MockData() -> [MovieModel] {
    return [
        MovieModel(
            title: "Ad Astra",
            popularityScore: 176.674,
            releaseYear: 2019,
            imageName: "star.fill",
            plotDescription: "The near future, a time when both hope and hardships drive humanity to look to the stars and beyond.",
            rating: 7.9,
            releaseDate: "2019-02-08",
            voteCount: 5000,
            genreId: 878
        ),
        MovieModel(
            title: "Avatar",
            popularityScore: 144.444,
            releaseYear: 2009,
            imageName: "leaf.fill",
            plotDescription: "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission.",
            rating: 8.0,
            releaseDate: "2009-12-02",
            voteCount: 20000,
            genreId: 878
        ),
        MovieModel(
            title: "The Lion King",
            popularityScore: 123.456,
            releaseYear: 1994,
            imageName: "crown.fill",
            plotDescription: "A young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.",
            rating: 8.8,
            releaseDate: "1994-02-11",
            voteCount: 15000,
            genreId: 16
        ),
        MovieModel(
            title: "Inception",
            popularityScore: 198.532,
            releaseYear: 2010,
            imageName: "brain.head.profile",
            plotDescription: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
            rating: 8.8,
            releaseDate: "2010-07-16",
            voteCount: 32000,
            genreId: 878
        ),
        MovieModel(
            title: "The Dark Knight",
            popularityScore: 210.987,
            releaseYear: 2008,
            imageName: "moon.stars.fill",
            plotDescription: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
            rating: 9.0,
            releaseDate: "2008-07-18",
            voteCount: 28000,
            genreId: 28
        )
    ]
}

