//
//  LaunchScreenViewController.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import UIKit

/// Displays a simple welcome message when the app launches
final class LaunchScreenViewController: UIViewController {
    
    // Welcome label
    var welcomeLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .lightGray
        
        // Create welcome label
        welcomeLabel = UILabel()
        welcomeLabel?.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel?.text = "Welcome to MovieDB"
        welcomeLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        welcomeLabel?.textAlignment = .center
        welcomeLabel?.textColor = .black
        
        // Add label to view
        if let welcomeLabel = welcomeLabel {
            view.addSubview(welcomeLabel)
            
            // Set constraints to center the label
            NSLayoutConstraint.activate([
                welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
        
        // Go to main screen after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.goToMainScreen()
        }
    }
    
    /// Navigates to the main movie list screen
    func goToMainScreen() {
        guard let window = view.window else { return }
        
        let mainVC = MovieListVC()
        let navigationController = UINavigationController(rootViewController: mainVC)
        
        window.rootViewController = navigationController
    }
}
