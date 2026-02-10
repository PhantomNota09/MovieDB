//
//  NetworkManager.swift
//  MovieDB
//
//  Created by Surya Rayala on 2/9/26.
//

import Foundation

protocol NetworkManagerProtocol {
    func getDataFromServer(url: String) async -> [MovieModel]
}

class NetworkManager: NetworkManagerProtocol {
    func getDataFromServer(url: String) async -> [MovieModel] {
        /// check for valid server url
        guard let serverURL = URL(string: url) else {
            print("Log: Invalid URL")
            return []
        }
        
        /// Handling the exception
        do {
            /// fetching the data from the server
            let (data, response) = try await URLSession.shared.data(from: serverURL)
            
            /// checking for valid server status code : 200 - successful , any other - not sucessful
            if let serverResponse = response as? HTTPURLResponse, serverResponse.statusCode != 200 {
                print("Log: No data received from server")
                return []
            }
            
            /// data is of DATA , which is serialized Object , it contains data in machine readable format
            /// To get the swift post array , we need to convert data object to model
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            return movieResponse?.results ?? []
            
        } catch {
            print("Log: Error fetching data from server")
            return []
        }
    }
}
