# MovieDB

A modern iOS movie database application built with UIKit that displays popular movies fetched from The Movie Database (TMDB) API.

## Overview

MovieDB is an iOS app that showcases a dynamic collection of popular movies from The Movie Database (TMDB). The app fetches real-time movie data from the TMDB API and displays it in a clean, intuitive interface. Users can browse through the latest popular movies and tap on any movie to view its detailed information.

## Features

- **Real-time Data**: Fetches live movie data from The Movie Database (TMDB) API
- **Clean Architecture**: Built using MVVM pattern with protocol-oriented design
- **Asynchronous Loading**: Uses modern Swift Concurrency (async/await) for network requests
- **Dynamic Image Loading**: Asynchronously loads movie posters from TMDB image servers
- **Detailed Movie Information**:
  - Movie title and poster image
  - Popularity score
  - User rating (vote average)
  - Release date
  - Vote count
  - Genre identifiers
  - Full plot overview
- **Smooth Navigation**: Seamless transitions between list and detail views

## Technical Architecture

### MVVM Pattern

The app follows the **Model-View-ViewModel** pattern with protocol-oriented programming:

#### Model Layer
- **`MovieModel`**: Codable struct representing individual movie data
- **`MovieResponse`**: API response wrapper containing an array of movies

#### ViewModel Layer
- **`MovieViewModel`**: Manages movie data and business logic
- **`MovieViewModelProtocol`**: Defines the contract for movie data management
- Provides formatting methods for display data

#### View Layer
- Storyboard-based UI with custom table view cells
- **`MovieTableViewCell`**: Custom cell for displaying movie items in list view
- **`MovieCollectionViewCell`**: Alternative collection view presentation

#### Controller Layer
- **`MovieListVC`**: Manages the movie list display and user interactions
- **`MovieDetailViewController`**: Handles detailed movie information presentation

### Networking

- **`NetworkManager`**: Handles all API communication
- **`NetworkManagerProtocol`**: Protocol defining network service contract
- Uses `URLSession` with async/await for modern, clean asynchronous code
- Implements proper error handling and status code validation

### Extensions

- **`UIImageView+Extension`**: Adds async image loading capability
  - Asynchronously fetches and displays images from URLs
  - Includes error handling with fallback to system images
  - Ensures UI updates on the main thread

### Constants

- **`Identifiers`**: Centralized cell reuse identifiers
- **`Server`**: API endpoints and base URLs
  - TMDB API endpoint for discovering movies
  - Image base URL for poster loading

## Data Source

This app uses **The Movie Database (TMDB) API** to fetch real-time movie data. The API provides:
- Popular and trending movies
- High-quality movie posters and backdrops
- Comprehensive movie metadata
- Regular updates with new releases

## API Configuration

The app uses The Movie Database (TMDB) API. The API key is configured in `Constants.swift`:

```swift
enum Server: String {
    case ImageBaseUrl = "https://image.tmdb.org/t/p/w500"
    case MovieDataUrl = "https://api.themoviedb.org/3/discover/movie?api_key=YOUR_API_KEY"
}
```

## Key Technologies

- **UIKit**: Core UI framework
- **Swift Concurrency**: async/await for asynchronous operations
- **URLSession**: Native networking
- **Codable**: JSON parsing and serialization
- **Protocol-Oriented Programming**: Flexible, testable architecture

## Project Structure

```
MovieDB/
├── Models/
│   └── MovieModel.swift
├── ViewModels/
│   └── MovieViewModel.swift
├── Views/
│   ├── MovieTableViewCell.swift
│   └── MovieCollectionViewCell.swift
├── Controllers/
│   ├── MovieListVC.swift
│   └── MovieDetailViewController.swift
├── Services/
│   └── NetworkManager.swift
├── Extensions/
│   └── Extensions.swift
├── Utilities/
│   └── Constants.swift
└── App/
    ├── AppDelegate.swift
    └── SceneDelegate.swift
```

## Screenshots
<img width="120" height="262" alt="simulator_screenshot_7C3BDA6B-BDA7-4415-AB56-764DFAE4C215" src="https://github.com/user-attachments/assets/21ff8986-012c-4e9a-8157-ae149ca4eff5" />
<img width="120" height="262" alt="simulator_screenshot_E03EE9E0-079F-4F4B-BC41-D526110DCD99" src="https://github.com/user-attachments/assets/5b291e7e-9e64-4597-bb52-9a211b615d84" />



