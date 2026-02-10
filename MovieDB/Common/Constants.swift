//
//  Constants.swift
//  MovieDB
//
//  Created by Surya Rayala on 2/9/26.
//

/// Enum for cell identifiers
enum Identifiers {
    static let movieTableViewCell = "MovieTableViewCell"
    static let movieCollectionViewCell = "MovieCollectionViewCell"
}

/// Server Endpoints
enum Server: String {
    case ImageBaseUrl = "https://image.tmdb.org/t/p/w500"
    case MovieDataUrl = "https://api.themoviedb.org/3/discover/movie?api_key=c91ed3a7a344459eccad9687acf0d07e"
}


