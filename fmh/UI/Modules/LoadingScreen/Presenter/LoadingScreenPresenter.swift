//
//  LoadingScreenPresenter.swift
//  fmh
//
//  Created: 11.05.2022
//

import Foundation

struct LoadingScreenModel {
    
    let backgroundImage: String
    let textDescription: String
}

protocol LoadingScreenProtocol: class {
    func setGreeting(greeting: String)
}

protocol LoadingScreenPresenterProtocol: class {
    init(view: LoadingScreenProtocol, model: LoadingScreenModel)
    func showGreeting()
}

class LoadingScreenPresenter: LoadingScreenPresenterProtocol {
    
    let view: LoadingScreenProtocol
    let model: LoadingScreenModel
    
    required init(view: LoadingScreenProtocol, model: LoadingScreenModel) {
        self.view = view
        self.model = model
    }
    
    func showGreeting() {
        let greeting = self.model.textDescription
        self.view.setGreeting(greeting: greeting)
    }
}
