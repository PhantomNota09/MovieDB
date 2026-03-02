//
//  MovieDetailView.swift
//  MovieDB
//
//  Created by Surya Rayala on 3/2/26.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: MovieModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Hero Image
                AsyncImage(url: URL(string: Server.ImageBaseUrl.rawValue + (movie.backdropPath ?? ""))) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .frame(height: 280)
                .clipped()
            }
            
            VStack {
                // Poster and Title Section
                HStack(alignment: .top, spacing: 16) {
                    // Poster Icon
                    AsyncImage(url: URL(string: Server.ImageBaseUrl.rawValue + (movie.posterPath ?? ""))) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.secondary.opacity(0.3)
                    }
                    .frame(width: 80, height: 80)
                    .cornerRadius(20)
                    
                    // Title and Genre
                    VStack(alignment: .leading, spacing: 4) {
                        Text(movie.title ?? "Unknown")
                            .font(.system(size: 22, weight: .semibold))
                            .lineLimit(2)
                        
                        Text("\(movie.genreIds ?? [0])")
                            .font(.system(size: 15))
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 8)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                // Overview Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Overview")
                        .font(.system(size: 20, weight: .bold))
                    
                    Text(movie.overview ?? "No overview available")
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                }
                .padding(.leading, 60)
                .padding(.trailing, 0)
                .padding(.top, 32)
                
                // Details Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Details")
                        .font(.system(size: 20, weight: .bold))
                    
                    Text("Release Date: \(movie.releaseDate ?? "Unknown")")
                        .font(.system(size: 15))
                    
                    Text("Vote Count: \(movie.voteCount ?? 0)")
                        .font(.system(size: 15))
                    
                    Text("Genre IDs: \(movie.genreIds ?? [0])")
                        .font(.system(size: 15))
                }
                .padding(.horizontal, 20)
                .padding(.top, 32)
                .padding(.bottom, 40)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}
