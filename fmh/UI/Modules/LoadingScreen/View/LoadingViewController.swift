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
//        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.image = UIImage.init(named: "2.png")
        return backgroundImage
    }()
    
    // UIView for background image
    private let viewForImage: UIView = {
       let viewForImage = UIView()
        viewForImage.translatesAutoresizingMaskIntoConstraints = false
        return viewForImage
    }()
    
    private var activityIndicator : UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor(named: "AccentColor")
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.isHidden = false
        return activityIndicator
    }()
    
    // UIView
    private var viewForLabel : UIView = {
        let viewForLabel = UIView()
        viewForLabel.translatesAutoresizingMaskIntoConstraints = false
        viewForLabel.layer.cornerRadius = 10
        return viewForLabel
    }()
    
    //TextLabel
    private let textLbl: UILabel = {
        let textLbl = UILabel()
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        textLbl.numberOfLines = 0
        textLbl.textAlignment = .center
        return textLbl
    }()
        
    // MARK: - Properties
    
    var presenter: LoadingScreenPresenterProtocol!
    private let customColors = Colors()
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLayout()
        setGreeting(greeting: "Ответственно и осознанно нести добро людям")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
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
        
        self.view.addSubview(viewForImage)
        viewForImage.backgroundColor = customColors.colorForView1
        NSLayoutConstraint.activate([
            viewForImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            viewForImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // BackgroundImage
        self.viewForImage.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: viewForImage.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: viewForImage.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: viewForImage.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: viewForImage.bottomAnchor)
        ])
        
        self.view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            
            activityIndicator.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            activityIndicator.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor)
           // activityIndicator.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -120)
        ])
        
        // UIView
        self.view.addSubview(viewForLabel)
        viewForLabel.backgroundColor = customColors.colorForView1
        NSLayoutConstraint.activate([
            viewForLabel.heightAnchor.constraint(equalToConstant: 100),
            viewForLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            viewForLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewForLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        ])

        // TEXTLabel
        self.viewForLabel.addSubview(textLbl)
        textLbl.textColor = customColors.colorForTextLbl1
        NSLayoutConstraint.activate([
            textLbl.topAnchor.constraint(equalTo: viewForLabel.topAnchor, constant: 10),
            textLbl.leadingAnchor.constraint(equalTo: viewForLabel.leadingAnchor, constant: 10),
            textLbl.trailingAnchor.constraint(equalTo: viewForLabel.trailingAnchor, constant: -10),
            textLbl.bottomAnchor.constraint(equalTo: viewForLabel.bottomAnchor, constant: -20)
        ])
    }
    
}


extension UILabel {
    func UIfontLabel(viewHeight: Double) {
        switch viewHeight {
        case 548.0...568.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 150)//iPhone 5S,SE
        case 647.0...667.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 180)//iPhone 6,7,8
        case 716.0...736.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 200)//iPhone 6+,7+,8+
        case 792...812.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 180)//iPhone X,XS,XR
        case 876.0...896.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 180)//iPhone XS_Max
        default: print("_____")
        }
    }
}
