//  
//  MainScreenRouter.swift
//  fmh
//
//  Created: 25.04.22
//

import UIKit

class MainScreenRouter {
    
    // MARK: - External vars
    weak var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

// MARK: - Main_ScreenRouterDelegate
extension MainScreenRouter: MainScreenRouterDelegate {
    
}
