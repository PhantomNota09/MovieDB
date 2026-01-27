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

The app follows the **MVC (Model-View-Controller)** pattern:

- **Model**: `MovieModel` - Represents movie data
- **View**: Storyboard-based UI with custom `MovieTableViewCell`
- **Controller**: 
  - `MovieListVC` - Manages the movie list display
  - `MovieDetailViewController` - Handles detailed movie information

## Sample Movies Included

The app includes mock data for the following movies:

- Ad Astra (2019)
- Avatar (2009)
- The Lion King (1994)
- Inception (2010)
- The Dark Knight (2008)

## Screenshots
<img width="120" height="262" alt="simulator_screenshot_8185F74B-F074-4DC8-9EA1-5A11E59B8976" src="https://github.com/user-attachments/assets/368fa481-bbdf-4b2b-91ca-75a3802543e5" />
<img width="120" height="262" alt="simulator_screenshot_775C21B5-1BD6-44BE-905B-144BCEDBE593" src="https://github.com/user-attachments/assets/79879f3a-b2ab-492c-9cb2-ef29dc636fbd" />


