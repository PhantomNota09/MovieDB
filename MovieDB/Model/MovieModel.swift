//
//  MovieModel.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import Foundation

// MARK: - API Response Model

/// Represents the response from the API
struct MovieResponse: Decodable {
    let results: [MovieModel]
}

// MARK: - Movie Model

/// Represents a movie with all its information
struct MovieModel: Decodable {
    let id: Int?
    let title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let backdrop_path: String?
    let vote_average: Double?
    let vote_count: Int?
    let release_date: String?
    let genre_ids: [Int]?
}
