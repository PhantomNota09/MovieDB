//
//  LaunchScreenViewController.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import UIKit

// MARK: - Launch Screen View Controller

/// Displays the app's launch screen with branding and animation
final class LaunchScreenViewController: UIViewController {
    
    // MARK: - UI Components
    
    /// App logo or icon image view
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        // Using SF Symbol for demo - replace with your actual logo
        imageView.image = UIImage(systemName: "film.fill")
        return imageView
    }()
    
    /// App name label
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MovieDB"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.textColor = .systemBlue
        return label
    }()
    
    /// Tagline or subtitle label
    private let taglineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your Movie Collection"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        return label
    }()
    
    /// Loading activity indicator
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .systemBlue
        return indicator
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateLaunchScreen()
    }
}

// MARK: - UI Setup

private extension LaunchScreenViewController {
    
    /// Sets up the user interface
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Add subviews
        view.addSubview(logoImageView)
        view.addSubview(appNameLabel)
        view.addSubview(taglineLabel)
        view.addSubview(activityIndicator)
        
        // Start loading indicator
        activityIndicator.startAnimating()
    }
    
    /// Sets up Auto Layout constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Logo constraints
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            logoImageView.widthAnchor.constraint(equalToConstant: 120),
            logoImageView.heightAnchor.constraint(equalToConstant: 120),
            
            // App name label constraints
            appNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            appNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            appNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            // Tagline label constraints
            taglineLabel.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 8),
            taglineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            taglineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            // Activity indicator constraints
            activityIndicator.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 40),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - Animation

private extension LaunchScreenViewController {
    
    /// Animates the launch screen elements
    func animateLaunchScreen() {
        // Initial state - hidden
        logoImageView.alpha = 0
        appNameLabel.alpha = 0
        taglineLabel.alpha = 0
        logoImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        // Animate logo
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut) {
            self.logoImageView.alpha = 1
            self.logoImageView.transform = .identity
        }
        
        // Animate app name
        UIView.animate(withDuration: 0.5, delay: 0.4, options: .curveEaseOut) {
            self.appNameLabel.alpha = 1
        }
        
        // Animate tagline
        UIView.animate(withDuration: 0.5, delay: 0.6, options: .curveEaseOut) {
            self.taglineLabel.alpha = 1
        }
        
        // Transition to main app after delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.transitionToMainApp()
        }
    }
    
    /// Transitions from launch screen to main app
    func transitionToMainApp() {
        // Get the window from the scene
        guard let window = view.window else { return }
        
        // Create the main view controller (your movie list)
        let mainVC = MovieListVC()
        let navigationController = UINavigationController(rootViewController: mainVC)
        
        // Set as root view controller with animation
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve) {
            window.rootViewController = navigationController
        }
    }
}
