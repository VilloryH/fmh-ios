//
//  SettingNewsViewController.swift
//  fmh
//
//  Created: 14.05.2022
//

import UIKit
import SwiftUI

class SettingNewsViewController: UIViewController {
    
    private var settingNewsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image for Background
        let imageViewBackground = UIImageView(image: UIImage(named: "BackGround.png"))
        imageViewBackground.frame = CGRect(x: 0, y: (navigationController?.navigationBar.bounds.height)!, width: self.view.bounds.width, height: self.view.bounds.height)
        imageViewBackground.clipsToBounds = true
        imageViewBackground.contentMode = .center
        self.view.addSubview(imageViewBackground)
        
        // Header with button
        let viewHeader = UILabel()
        viewHeader.frame = CGRect(x: 0, y: (navigationController?.navigationBar.frame.height)!, width: self.view.bounds.width, height: 55)
        print(self.view.bounds)
        viewHeader.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        self.view.addSubview(viewHeader)
        
        // News Label
        let newsLabel = UILabel()
        newsLabel.frame = CGRect(x: 0, y: 0, width: 160, height: 42)
        newsLabel.textColor = .black
        newsLabel.font = UIFont(name: "SFUIDisplay-Regular", size: 19)
        newsLabel.text = "Панель управления новостями"
        newsLabel.textAlignment = .center
        newsLabel.numberOfLines = 2
        let parentNewsLabel = viewHeader
        parentNewsLabel.addSubview(newsLabel)
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        newsLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        newsLabel.heightAnchor.constraint(equalToConstant: 42).isActive = true
        newsLabel.leadingAnchor.constraint(equalTo: parentNewsLabel.leadingAnchor, constant: 24).isActive = true
        newsLabel.centerYAnchor.constraint(equalTo: parentNewsLabel.centerYAnchor).isActive = true
        
        // add button ADD
        let buttonEdit = UIButton()
        buttonEdit.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        buttonEdit.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        let parentButtonEdit = self.view!
        parentButtonEdit.addSubview(buttonEdit)
        buttonEdit.translatesAutoresizingMaskIntoConstraints = false
        buttonEdit.trailingAnchor.constraint(equalTo: parentButtonEdit.trailingAnchor, constant: -16).isActive = true
        buttonEdit.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        //buttonEdit.addTarget(self, action: #selector(buttonEditAction), for: .touchUpInside)
        
        // add button FILTER
        let buttonFilter = UIButton()
        buttonFilter.frame = CGRect(x: 0, y: 0, width: 18, height: 20)
        buttonFilter.setImage(UIImage(named: "иконка Фильтры.png"), for: .normal)
        let parentButtonFilter = self.view!
        parentButtonFilter.addSubview(buttonFilter)
        buttonFilter.translatesAutoresizingMaskIntoConstraints = false
        buttonFilter.trailingAnchor.constraint(equalTo: buttonEdit.leadingAnchor, constant: -29).isActive = true
        buttonFilter.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        
        // add button SORT
        let buttonSort = UIButton()
        buttonSort.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        buttonSort.setImage(UIImage(named: "иконка сортировка.png"), for: .normal)
        let parentButtonSort = self.view!
        parentButtonSort.addSubview(buttonSort)
        buttonSort.translatesAutoresizingMaskIntoConstraints = false
        buttonSort.trailingAnchor.constraint(equalTo: buttonFilter.leadingAnchor, constant: -30).isActive = true
        buttonSort.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        
      
        
    }
    
}
