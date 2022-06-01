//
//  LoadingPresenter.swift
//  fmh
//
//  Created: 14.05.2022
//

import UIKit

final class LoadingPresenter {

    weak private var output: LoadingPresenterOutput?

    init(output: LoadingPresenterOutput) {
        self.output = output
    }
    
}

// MARK: - LoadingPresenterInput
extension LoadingPresenter: LoadingPresenterInput {
    
    func isDisplayed() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.output?.hide()
        }
    }
    
}
