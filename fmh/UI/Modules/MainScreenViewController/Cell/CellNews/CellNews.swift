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
    
    let newLabel = UILabel(text: "Text", font: .avenirNextDemiBold20())
    
    let newDate: UILabel = {
        let label = UILabel(text: "11.11.2022", font: .avenirNextDemiBold20())
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    
    let cellLabel: UILabel = {
        let cell = UILabel()
        return cell
    }()
    
    let openNewsButtton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "ArrowDown"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        openNewsButtton.addTarget(self, action: #selector(openNews), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func openNews() {
        print("show current new")
    }
    
    func setConstraints() {
        
        self.addSubview(newDate)
        NSLayoutConstraint.activate([
            newDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35),
            newDate.widthAnchor.constraint(equalToConstant: 65),
            newDate.heightAnchor.constraint(equalToConstant: 30),
            newDate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
        ])
        
        self.addSubview(newsIcon)
        NSLayoutConstraint.activate([
            newsIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -35),
            newsIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            newsIcon.widthAnchor.constraint(equalToConstant: 20),
            newsIcon.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        self.addSubview(openNewsButtton)
        NSLayoutConstraint.activate([
            openNewsButtton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            openNewsButtton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            openNewsButtton.widthAnchor.constraint(equalToConstant: 12),
            openNewsButtton.heightAnchor.constraint(equalToConstant: 8)
        ])
        
        self.addSubview(newLabel)
        NSLayoutConstraint.activate([
            newLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -28),
            newLabel.leadingAnchor.constraint(equalTo: self.newsIcon.trailingAnchor, constant: 15),
            newLabel.trailingAnchor.constraint(equalTo: self.openNewsButtton.leadingAnchor, constant: -20),
            newLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
