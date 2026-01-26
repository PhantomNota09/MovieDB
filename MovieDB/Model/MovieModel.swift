//
//  MovieModel.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import Foundation


struct MovieModel {
    let title: String?
    let score: String?
    let year: String?
    let image: String?
    
    let description: String?
    let rating: String?
    let detailedYear: String?
    let voteCount: String?
    let genreId: String?
}

func MockData() -> [MovieModel] {
    
    var movieData: [MovieModel]? = []

    let movie1 = MovieModel(title: "Title: Ad Astra", score: "Popularity Score: 176.674", year: "Release Year: 2019", image: "star.fill", description: "The near future, a time when both hope and hardships drive humanity to look to the stars and beyond.",rating: "Ratings: 7.9/10", detailedYear: "Release Year:  2019-02-08", voteCount: "Vote Count: 5000", genreId: "Genre IDs: 878")

    let movie2 = MovieModel(title: "Title: Avatar", score: "Popularity Score: 144.444", year: "Release Year: 2009", image: "leaf.fill", description: "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission.", rating: "Ratings: 8.0/10",detailedYear: "Release Year:  2009-12-02", voteCount: "Vote Count: 20000", genreId: "Genre IDs: 878")

    let movie3 = MovieModel(title: "Title: The Lion King", score: "Popularity Score: 123.456", year: "Release Year: 1994", image: "crown.fill", description: "A young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.", rating: "Ratings: 8.8/10", detailedYear: "Release Year: 1994-02-11", voteCount: "Vote Count: 15000", genreId: "Genre IDs: 16")

    let movie4 = MovieModel(title: "Title: Inception", score: "Popularity Score: 198.532", year: "Release Year: 2010", image: "brain.head.profile", description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.", rating: "Ratings: 8.8/10", detailedYear: "Release Year: 2010-07-16", voteCount: "Vote Count: 32000", genreId: "Genre IDs: 878")

    let movie5 = MovieModel(title: "Title: The Dark Knight", score: "Popularity Score: 210.987", year: "Release Year: 2008", image: "moon.stars.fill", description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", rating: "Ratings: 9.0/10", detailedYear: "Release Year: 2008-07-18", voteCount: "Vote Count: 28000", genreId: "Genre IDs: 28")

    movieData?.append(movie1)
    movieData?.append(movie2)
    movieData?.append(movie3)
    movieData?.append(movie4)
    movieData?.append(movie5)
    
    return movieData ?? []

}
