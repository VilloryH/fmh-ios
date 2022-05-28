//
//  CellNews.swift
//  fmh
//
//  Created: 30.04.22
//

import UIKit

protocol ChangeTextDelegate: AnyObject {
    func updateText(text: String, image: String)
}

class CellNews: UITableViewCell {
    
    private var resultView = UIView()
    private let newsIcon = UIImageView()
    private let newsLabel = UILabel()
    private var newsTextLabel = UILabel()
    
    private let newsDate: UILabel = {
        let label = UILabel(text: "11.11.2022", font: .avenirNextDemiBold20())
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    
    private let cellLabel = UILabel()
    
    private let openNewsIcon = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI () {
        let wallsColor = CGColor(red: 0.245, green: 0.245, blue: 0.245, alpha: 0.93)
        self.layer.position.y = CGPoint.zero.x
        self.layer.borderColor = wallsColor
        self.layer.borderWidth = 15
        self.backgroundColor = UIColor(white: 0, alpha: 0)
        
        self.addSubview(resultView)
        self.resultView.backgroundColor = .white
        self.resultView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.resultView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
            self.resultView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.resultView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.resultView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.resultView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
<<<<<<< HEAD
        ])
        
        self.resultView.addSubview(self.newsIcon)
        self.newsIcon.image = UIImage(named: "Announcement")
        
        self.resultView.addSubview(self.newsLabel)
        self.newsLabel.text = "Text"
        self.newsLabel.font = UIFont(name: "Avenir Next", size: 20)
        
        self.resultView.addSubview(self.openNewsIcon)
        
        self.resultView.addSubview(self.newsDate)
        self.newsDate.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 0.9325993337)
        self.newsDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.newsDate.trailingAnchor.constraint(equalTo: self.resultView.trailingAnchor, constant: 0),
            self.newsDate.bottomAnchor.constraint(equalTo: self.resultView.bottomAnchor, constant: 0),
            self.newsDate.widthAnchor.constraint(equalToConstant: 125),
            self.newsDate.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        self.resultView.addSubview(self.newsTextLabel)
        self.newsTextLabel.numberOfLines = 0
        self.newsTextLabel.sizeToFit()
        self.newsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.newsTextLabel.topAnchor.constraint(equalTo: self.newsLabel.bottomAnchor, constant: 5),
            self.newsTextLabel.leadingAnchor.constraint(equalTo: self.resultView.leadingAnchor, constant: 20),
            self.newsTextLabel.trailingAnchor.constraint(equalTo: self.resultView.trailingAnchor, constant: -20),
            self.newsTextLabel.bottomAnchor.constraint(equalTo: self.newsDate.topAnchor, constant: -5)
=======
        ])
        
        self.resultView.addSubview(self.newsIcon)
        self.newsIcon.image = UIImage(named: "Announcement")
        
        self.resultView.addSubview(self.newsLabel)
        self.newsLabel.text = "Text"
        self.newsLabel.font = UIFont(name: "Avenir Next", size: 20)
        
        self.resultView.addSubview(self.newsDate)
        self.newsDate.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 0.9325993337)
        self.newsDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.newsDate.trailingAnchor.constraint(equalTo: self.resultView.trailingAnchor, constant: 0),
            self.newsDate.bottomAnchor.constraint(equalTo: self.resultView.bottomAnchor, constant: 0),
            self.newsDate.widthAnchor.constraint(equalToConstant: 125),
            self.newsDate.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        self.resultView.addSubview(self.newsTextLabel)
        self.newsTextLabel.numberOfLines = 0
        self.newsTextLabel.sizeToFit()
        self.newsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.newsTextLabel.topAnchor.constraint(equalTo: self.newsLabel.bottomAnchor, constant: 5),
            self.newsTextLabel.leadingAnchor.constraint(equalTo: self.resultView.leadingAnchor, constant: 20),
            self.newsTextLabel.trailingAnchor.constraint(equalTo: self.resultView.trailingAnchor, constant: -20),
            self.newsTextLabel.bottomAnchor.constraint(equalTo: self.newsDate.topAnchor, constant: -5)
        ])
        
        self.resultView.addSubview(self.openNewsIcon)
        self.openNewsIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.openNewsIcon.topAnchor.constraint(equalTo: self.resultView.topAnchor, constant: 25),
            self.openNewsIcon.trailingAnchor.constraint(equalTo: self.resultView.trailingAnchor, constant: -15)
>>>>>>> mainScreen
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var x = 25.0, y = 15.0
        self.newsIcon.frame = CGRect(x: x, y: y, width: 21, height: 20)
        x += 36.0; y += 1
        self.newsLabel.frame = CGRect(x: x, y: y, width: 240, height: 19)
<<<<<<< HEAD
        x += 245; y += 5.59
        self.openNewsIcon.frame = CGRect(x: x, y: y, width: 12, height: 7.41)
=======
        self.openNewsIcon.frame = CGRect(x: 0, y: 0, width: 12, height: 7.41)
>>>>>>> mainScreen
    }
    
    private func setFont(font: UIFont?) -> UIFont {
        if let font = font {
            return font
        } else {
            return UIFont()
        }
    }
}

extension CellNews: ChangeTextDelegate {
    func updateText(text: String, image: String) {
        self.openNewsIcon.image = UIImage(named: image)
        self.newsTextLabel.text = text
    }
}
