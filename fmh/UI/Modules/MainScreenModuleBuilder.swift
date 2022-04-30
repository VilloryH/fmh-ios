//
//  MainScreenModule_Builder.swift
//  fmh
//
//  Created: 26.04.22
//

import UIKit

class ModelBuilder: MainScreenBuilder {

    static func createMain() -> UIViewController {
        let model = MainScreenModel.init(news: News(), requests: Requests())
        let view = MainScreenViewController()
        let presenter = MainScreenPresenter(viewController: view, model: model, router: nil)
        view.presenter = presenter
        return view
    }
    
    static func createNavController() -> UINavigationController {
        let navController = UINavigationController(rootViewController: createMain())
        navController.navigationBar.backgroundColor = .white
        navController.view.backgroundColor = .white
        return navController
    }
    
}
