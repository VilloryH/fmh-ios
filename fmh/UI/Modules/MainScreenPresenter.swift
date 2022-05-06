//  
//  MainScreenPresenter.swift
//  fmh
//
//  Created: 25.04.22
//

import UIKit

class MainScreenPresenter {
    
    // MARK: - External vars
    weak var viewController: MainScreenViewControllerDelegate!
    var model: MainScreenModel!
   
    // MARK: - Private vars
    private var router: MainScreenRouterDelegate!
    
    init(viewController: MainScreenViewControllerDelegate, model: MainScreenModel, router: MainScreenRouterDelegate?) {
        self.model = model
        self.viewController = viewController
        self.router = router
    }
   
}

// MARK: - MainScreenPresenterDelegate
extension MainScreenPresenter: MainScreenPresenterDelegate {
    
}
