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
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.image = UIImage.init(named: "2.png")
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
        
        viewForLabel.backgroundColor = .cyan
        viewForLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewForLabel
    }()
    
    private let textLbl: UILabel = {
        let textLbl = UILabel()
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        textLbl.numberOfLines = 0
        textLbl.textAlignment = .center
        textLbl.backgroundColor = .lightGray
        return textLbl
    }()
        
    // MARK: - Properties
    
    var presenter: LoadingScreenPresenterProtocol!
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLayout()
        setGreeting(greeting: "Ответственно и осознанно нести добро людям")
    }
}

extension LoadingViewController: LoadingScreenProtocol {
    func setGreeting(greeting: String) {
        textLbl.text = greeting
    }
}

    // MARK: - Constraints

extension LoadingViewController {
    
    func setupLayout() {
        
        // BackgroundImage
        self.view.addSubview(backgroundImage)
        backgroundImage.frame = view.frame
        
        // UIView
        self.backgroundImage.addSubview(viewForLabel)
        NSLayoutConstraint.activate([
            viewForLabel.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 456),
            viewForLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 100),
            viewForLabel.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -100),
            viewForLabel.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -137)
        ])

        // TEXTLabel
        self.viewForLabel.addSubview(textLbl)
        NSLayoutConstraint.activate([
            textLbl.heightAnchor.constraint(equalTo: viewForLabel.heightAnchor, constant: 50),
            textLbl.leadingAnchor.constraint(equalTo: viewForLabel.leadingAnchor, constant: 20),
            textLbl.trailingAnchor.constraint(equalTo: viewForLabel.trailingAnchor, constant: -20),
            textLbl.bottomAnchor.constraint(equalTo: viewForLabel.bottomAnchor, constant: -100)
        ])
        
  //      self.view.addSubview(activityIndicator)
//        NSLayoutConstraint.activate([
//            activityIndicator.topAnchor.constraint(equalTo: view.topAnchor),
//            activityIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            activityIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
//            activityIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
    }
    
}
