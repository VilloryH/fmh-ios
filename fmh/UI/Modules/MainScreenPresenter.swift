//  
//  MainScreenPresenter.swift
//  fmh
//
//  Created: 25.04.22
//

import UIKit

class MainScreenPresenter {
    
    // MARK: - External vars
    weak var tableViewController: MainScreenTableViewControllerDelegate!
    var model: MainScreenModel!
   
    // MARK: - Private vars
    private var router: MainScreenRouterDelegate!
    
    init(tableViewController: MainScreenTableViewControllerDelegate, model: MainScreenModel, router: MainScreenRouterDelegate?) {
        self.model = model
        self.tableViewController = tableViewController
        self.router = router
    }
   
}

// MARK: - MainScreenPresenterDelegate
extension MainScreenPresenter: MainScreenPresenterDelegate {
    
}
