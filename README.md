# MovieDB

A simple iOS movie database application built with UIKit that displays a list of popular movies and their detailed information.

## Overview

MovieDB is a straightforward iOS app that showcases a collection of popular movies. Users can browse through a list of movies and tap on any movie to view its detailed information including ratings, release dates, descriptions, and more.

## Features

- Clean and intuitive user interface
- Browse a list of popular movies
- View detailed movie information including:
  - Title
  - Poster image (using SF Symbols)
  - Popularity score
  - Rating
  - Release date
  - Vote count
  - Genre ID
  - Plot description
- mooth navigation between list and detail views

### Architecture

The app follows the **MVVM (Model-View-ViewModel)** pattern:

- **Model**: `MovieModel` - Represents movie data with properties like title, rating, release date, etc.
- **ViewModel**: `MovieViewModel` - Manages movie data, provides formatting methods, and handles business logic
- **View**: Storyboard-based UI with custom `MovieTableViewCell`
- **Controller**: 
  - `MovieListVC` - Manages the movie list display and user interactions
  - `MovieDetailViewController` - Handles detailed movie information display

## Sample Movies Included

The app includes mock data for the following movies:

- Ad Astra (2019)
- Avatar (2009)
- The Lion King (1994)
- Inception (2010)
- The Dark Knight (2008)

## Screenshots

<img width="120" height="262" alt="simulator_screenshot_81F9D084-0E2E-4601-A91B-17C2B3F4CD78" src="https://github.com/user-attachments/assets/1fd2d012-6032-4d56-a0db-13093033b9be" />
<img width="120" height="262" alt="simulator_screenshot_174019C5-3F18-4AEA-A832-A7FD777BD47A" src="https://github.com/user-attachments/assets/fee2984f-d979-49be-b881-5d098c6ad677" />
