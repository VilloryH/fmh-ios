//
//  LoadingScreenViewController.swift
//  fmh
//
//  Created: 11.05.2022
//

import UIKit

class LoadingScreenViewController: UIViewController {
    
    // MARK: - Outlets
    
    private let textLbl: UILabel = {
        let textLbl = UILabel()
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        textLbl.backgroundColor = .lightGray
        return textLbl
    }()
    
    // MARK: - Properties
    
    var presenter: LoadingScreenPresenterProtocol!
    
    // MARK: - Life cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setConstraints()
        setGreeting(greeting: "Hello")
    }
    
    func setConstraints() {
        self.view.addSubview(textLbl)
        textLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        textLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textLbl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
}

extension LoadingScreenViewController: LoadingScreenProtocol {
    func setGreeting(greeting: String) {
        textLbl.text = greeting
    }
}
