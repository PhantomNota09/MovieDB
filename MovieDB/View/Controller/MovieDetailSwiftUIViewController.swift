//
//  MovieDetailSwiftUIViewController.swift
//  MovieDB
//
//  Created by Surya Rayala on 3/2/26.
//


import UIKit
import SwiftUI

final class MovieDetailSwiftUIViewController: UIViewController {
    
    // MARK: - Properties
    
    var movie: MovieModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSwiftUIView()
    }
    
    // MARK: - Setup
    
    private func setupSwiftUIView() {
        guard let movie = movie else { return }
        
        // Create the SwiftUI view
        let swiftUIView = MovieDetailView(movie: movie)
        
        // Wrap it in a UIHostingController
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // Add as child view controller
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Setup constraints
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
}