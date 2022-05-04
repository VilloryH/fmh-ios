//  
//  MainScreenProtocol.swift
//  fmh
//
//  Created: 25.04.22
//Muad8824diB

import UIKit

// MARK: - ViewController
protocol MainScreenTableViewControllerDelegate: AnyObject {
    
}

// MARK: - Presenter
protocol MainScreenPresenterDelegate {
    
}

// MARK: - Router
protocol MainScreenRouterDelegate {
    
}

// MARK: - Builder
protocol MainScreenBuilder {
    static func createMain() -> UINavigationController
}
