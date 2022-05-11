//
//  LoadingViewController.swift
//  fmh
//
//  Created: 11.05.2022
//

import UIKit

class LoadingViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let backgroundImage: UIImageView = {
       let backgroundImage = UIImageView()
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = UIImage.init(named: "1.png")
        return backgroundImage
    }()
    
    private var activityIndicator : UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor(named: "AccentColor")
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private var viewForLabel : UIView = {
        let viewForLabel = UIView()
        
        // some code
        
        viewForLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewForLabel
    }()
    
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
}

extension LoadingViewController: LoadingScreenProtocol {
    func setGreeting(greeting: String) {
        textLbl.text = greeting
    }
}

    // MARK: - Constraints

extension LoadingViewController {
    
    func setConstraints() {
        
        self.view.addSubview(backgroundImage)
        backgroundImage.frame = view.frame

        
  //      self.view.addSubview(textLbl)
//        NSLayoutConstraint.activate([
//            textLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            textLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            textLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            textLbl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
//        ])
        
  //      self.view.addSubview(activityIndicator)
//        NSLayoutConstraint.activate([
//            activityIndicator.topAnchor.constraint(equalTo: view.topAnchor),
//            activityIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            activityIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
//            activityIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
    }
    
}
