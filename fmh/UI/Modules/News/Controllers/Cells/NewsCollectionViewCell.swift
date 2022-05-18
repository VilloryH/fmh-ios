//
//  NewsCollectionViewCell.swift
//  fmh
//
//  Created: 19.05.2022
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            udateAppearance()
        }
    }
    //MARK: - констрейнт для сжатого состояния
    private var collapsedConstraint: NSLayoutConstraint!
    
    //MARK: - констрайнт для расширенного состояния
    private var expandedConstraint: NSLayoutConstraint!
    
    private lazy var mainContainer = UIView()
    private lazy var topContainer = UIView()
    private lazy var bottomContainer = UIView()
    
    func makeConstraint() {
        contentView.addSubview(mainContainer)
        mainContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        mainContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        mainContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        mainContainer.addSubview(topContainer)
        topContainer.leftAnchor.constraint(equalTo: mainContainer.leftAnchor).isActive = true
        topContainer.topAnchor.constraint(equalTo: mainContainer.topAnchor).isActive = true
        topContainer.rightAnchor.constraint(equalTo: mainContainer.rightAnchor).isActive = true
        topContainer.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        mainContainer.addSubview(bottomContainer)
        bottomContainer.leftAnchor.constraint(equalTo: mainContainer.leftAnchor).isActive = true
        bottomContainer.rightAnchor.constraint(equalTo: mainContainer.rightAnchor).isActive = true
        bottomContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor).isActive = true
        bottomContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor).priority = .defaultLow
        bottomContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        collapsedConstraint = topContainer.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor)
        collapsedConstraint.priority = .defaultLow
        
        expandedConstraint = bottomContainer.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor)
        expandedConstraint.priority = .defaultLow
        
    }
    
    func udateAppearance() {
        collapsedConstraint.isActive = !isSelected
        expandedConstraint.isActive = isSelected
//        UIView.animate(withDuration: 0.3) {
//            let upDown = CGAffineTransform(rotationAngle: .pi * -0.999)
//            chevroneImageView
//        }

    }
}
