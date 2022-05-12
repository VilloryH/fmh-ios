//
//  CellNews.swift
//  fmh
//
//  Created: 30.04.22
//

import UIKit

class CellNews: UITableViewCell {
  
    let newsIcon: UIImageView = {
        let image = UIImage(named: "Announcement")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let newsLabel = UILabel(text: "Text", font: .avenirNextDemiBold20())
    
    let newsTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    let newsDate: UILabel = {
        let label = UILabel(text: "11.11.2022", font: .avenirNextDemiBold20())
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    
    let cellLabel: UILabel = {
        let cell = UILabel()
        return cell
    }()
    
    let openNewsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "ArrowDown"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        self.selectionStyle = .none

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        
        self.addSubview(newsIcon)
        NSLayoutConstraint.activate([
            newsIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            newsIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            newsIcon.widthAnchor.constraint(equalToConstant: 20),
            newsIcon.heightAnchor.constraint(equalToConstant: 20)
        ])

        self.addSubview(openNewsButton)
        NSLayoutConstraint.activate([
            openNewsButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            openNewsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            openNewsButton.widthAnchor.constraint(equalToConstant: 12),
            openNewsButton.heightAnchor.constraint(equalToConstant: 8)
        ])

        self.addSubview(newsLabel)
        NSLayoutConstraint.activate([
            newsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            newsLabel.leadingAnchor.constraint(equalTo: self.newsIcon.trailingAnchor, constant: 15),
            newsLabel.trailingAnchor.constraint(equalTo: self.openNewsButton.leadingAnchor, constant: -20),
            newsLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        self.addSubview(newsTextLabel)
        NSLayoutConstraint.activate([
            newsTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            newsTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            newsTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            newsTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -35),
        ])
        
        self.addSubview(newsDate)
        NSLayoutConstraint.activate([
            newsDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35),
            newsDate.widthAnchor.constraint(equalToConstant: 65),
            newsDate.heightAnchor.constraint(equalToConstant: 30),
            newsDate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
        ])
    }
    
}
