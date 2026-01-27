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
    
    // MARK: - Properties
    
    /// The title of the movie
    let title: String?
    
    /// The popularity score of the movie
    let score: String?
    
    /// The release year of the movie
    let year: String?
    
    /// The SF Symbol name for the movie poster
    let image: String?
    
    /// A brief description of the movie plot
    let description: String?
    
    /// The movie's rating (e.g., "7.9/10")
    let rating: String?
    
    /// The detailed release date of the movie
    let detailedYear: String?
    
    /// The number of votes the movie has received
    let voteCount: String?
    
    /// The genre identifier for the movie
    let genreId: String?
}

// MARK: - Mock Data Generator

/// Generates mock movie data for testing and development purposes
func MockData() -> [MovieModel] {
    return [
        createAdAstraMovie(),
        createAvatarMovie(),
        createLionKingMovie(),
        createInceptionMovie(),
        createDarkKnightMovie()
    ]
}

// MARK: - Movie Factory Methods

/// Creates the Ad Astra movie data
private func createAdAstraMovie() -> MovieModel {
    return MovieModel(
        title: "Title: Ad Astra",
        score: "Popularity Score: 176.674",
        year: "Release Year: 2019",
        image: "star.fill",
        description: "The near future, a time when both hope and hardships drive humanity to look to the stars and beyond.",
        rating: "Ratings: 7.9/10",
        detailedYear: "Release Year:  2019-02-08",
        voteCount: "Vote Count: 5000",
        genreId: "Genre IDs: 878"
    )
}

/// Creates the Avatar movie data
private func createAvatarMovie() -> MovieModel {
    return MovieModel(
        title: "Title: Avatar",
        score: "Popularity Score: 144.444",
        year: "Release Year: 2009",
        image: "leaf.fill",
        description: "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission.",
        rating: "Ratings: 8.0/10",
        detailedYear: "Release Year:  2009-12-02",
        voteCount: "Vote Count: 20000",
        genreId: "Genre IDs: 878"
    )
}

/// Creates The Lion King movie data
private func createLionKingMovie() -> MovieModel {
    return MovieModel(
        title: "Title: The Lion King",
        score: "Popularity Score: 123.456",
        year: "Release Year: 1994",
        image: "crown.fill",
        description: "A young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.",
        rating: "Ratings: 8.8/10",
        detailedYear: "Release Year: 1994-02-11",
        voteCount: "Vote Count: 15000",
        genreId: "Genre IDs: 16"
    )
}

/// Creates the Inception movie data
private func createInceptionMovie() -> MovieModel {
    return MovieModel(
        title: "Title: Inception",
        score: "Popularity Score: 198.532",
        year: "Release Year: 2010",
        image: "brain.head.profile",
        description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
        rating: "Ratings: 8.8/10",
        detailedYear: "Release Year: 2010-07-16",
        voteCount: "Vote Count: 32000",
        genreId: "Genre IDs: 878"
    )
}

/// Creates The Dark Knight movie data
private func createDarkKnightMovie() -> MovieModel {
    return MovieModel(
        title: "Title: The Dark Knight",
        score: "Popularity Score: 210.987",
        year: "Release Year: 2008",
        image: "moon.stars.fill",
        description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
        rating: "Ratings: 9.0/10",
        detailedYear: "Release Year: 2008-07-18",
        voteCount: "Vote Count: 28000",
        genreId: "Genre IDs: 28"
    )
}
