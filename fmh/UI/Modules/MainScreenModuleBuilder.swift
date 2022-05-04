//
//  MainScreenModule_Builder.swift
//  fmh
//
//  Created: 26.04.22
//

import UIKit

class MainScreenModelBuilder: MainScreenBuilder {
    
    static func createMain() -> UINavigationController {
        let model = MainScreenModel.init(news: News(), requests: Requests())
        let view = MainScreenTableViewController()
        let presenter = MainScreenPresenter(tableViewController: view, model: model, router: nil)
        view.presenter = presenter
        let navViewController = UINavigationController(rootViewController: view)
        navViewController.navigationBar.backgroundColor = UIColor(red: 0, green: 0.6859514117, blue: 0.68581146, alpha: 1) // временный навбар
        return navViewController
    }
    
}
