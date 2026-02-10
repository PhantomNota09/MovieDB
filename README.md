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
<img width="120" height="262" alt="simulator_screenshot_7C3BDA6B-BDA7-4415-AB56-764DFAE4C215" src="https://github.com/user-attachments/assets/21ff8986-012c-4e9a-8157-ae149ca4eff5" />
<img width="120" height="262" alt="simulator_screenshot_E03EE9E0-079F-4F4B-BC41-D526110DCD99" src="https://github.com/user-attachments/assets/5b291e7e-9e64-4597-bb52-9a211b615d84" />



