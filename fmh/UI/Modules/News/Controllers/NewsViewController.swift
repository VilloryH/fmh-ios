//
//  NewsViewController.swift
//  fmh
//
//  Created: 11.05.2022
//

import UIKit

class NewsViewController: UIViewController {

    private lazy var newsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.allowsMultipleSelection = true
        view.alwaysBounceVertical = true
        view.delegate = self
        view.dataSource = self
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image for Background
        
        let imageViewBackground = UIImageView(image: UIImage(named: "BackGround.png"))
        imageViewBackground.frame = CGRect(origin: .zero, size: CGSize(width: self.view.bounds.width, height: self.view.bounds.height))
        imageViewBackground.clipsToBounds = true
        imageViewBackground.contentMode = .scaleToFill
        self.view.addSubview(imageViewBackground)
        
        // Header with button
        let viewHeader = UIView()
        viewHeader.frame = CGRect(origin: .zero, size: CGSize(width: self.view.bounds.width, height: 55))
        print(self.view.bounds)
        viewHeader.backgroundColor = Constant.Collor.headerNews
        self.view.addSubview(viewHeader)
        
        
        // News Label
        let newsLabel = UILabel()
        newsLabel.frame = CGRect(x: 0, y: 0, width: 80, height: 22)
        newsLabel.textColor = .black
        newsLabel.font = Constant.Font.titleHeader
        newsLabel.text = "Новости"
        let parentNewsLabel = viewHeader
        parentNewsLabel.addSubview(newsLabel)
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        newsLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        newsLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        newsLabel.leadingAnchor.constraint(equalTo: parentNewsLabel.leadingAnchor, constant: 24).isActive = true
        newsLabel.centerYAnchor.constraint(equalTo: parentNewsLabel.centerYAnchor).isActive = true
        
        // add button EDIT
        let buttonEdit = UIButton()        
        buttonEdit.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        buttonEdit.setImage(UIImage(named: "иконка редактировать"), for: .normal)
        let parentButtonEdit = self.view!
        parentButtonEdit.addSubview(buttonEdit)
        buttonEdit.translatesAutoresizingMaskIntoConstraints = false
        buttonEdit.trailingAnchor.constraint(equalTo: parentButtonEdit.trailingAnchor, constant: -16).isActive = true
        buttonEdit.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        buttonEdit.addTarget(self, action: #selector(buttonEditAction), for: .touchUpInside)
        
        // add button FILTER
        let buttonFilter = UIButton()
        buttonFilter.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        buttonFilter.setImage(UIImage(named: "иконка Фильтры"), for: .normal)
        let parentButtonFilter = self.view!
        parentButtonFilter.addSubview(buttonFilter)
        buttonFilter.translatesAutoresizingMaskIntoConstraints = false
        buttonFilter.trailingAnchor.constraint(equalTo: buttonEdit.leadingAnchor, constant: -29).isActive = true
        buttonFilter.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        
        // add button SORT
        let buttonSort = UIButton()
        buttonSort.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        buttonSort.setImage(UIImage(named: "иконка сортировка"), for: .normal)
        let parentButtonSort = self.view!
        parentButtonSort.addSubview(buttonSort)
        buttonSort.translatesAutoresizingMaskIntoConstraints = false
        buttonSort.trailingAnchor.constraint(equalTo: buttonFilter.leadingAnchor, constant: -30).isActive = true
        buttonSort.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        
        // add button INFO
        let buttonInfo = UIButton()
        buttonInfo.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        buttonInfo.setImage(UIImage(named: "Иконка Информация"), for: .normal)
        let parentButtonInfo = self.view!
        parentButtonInfo.addSubview(buttonInfo)
        buttonInfo.translatesAutoresizingMaskIntoConstraints = false
        buttonInfo.trailingAnchor.constraint(equalTo: buttonSort.leadingAnchor, constant: -29).isActive = true
        buttonInfo.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        buttonInfo.addTarget(self, action: #selector(buttonInfoAction), for: .touchUpInside)
        
        
        
        // MARK: - Set cleare background for tableView
      
    }

    //MARK: - Actions for buttonHeader
    
    @objc func buttonInfoAction(sender: UIButton) {
        print("button Info")
        // add alert info
    }
    
    @objc func buttonEditAction() {
        let settingNewsVC = SettingNewsViewController()
        navigationController?.pushViewController(settingNewsVC, animated: true)
    }
    
    func configureView() {
        newsCollectionView.backgroundColor = .clear
        newsCollectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: "NewsCell")
        self.view.addSubview(newsCollectionView)
        newsCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        newsCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        newsCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        newsCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
    
        
}




//MARK: - Extension for CollectionView

extension NewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath)
        return cell
    }
    
    
}

extension NewsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionView.performBatchUpdates(nil)
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
        collectionView.performBatchUpdates(nil)
        return true
    }
}
  



    
    
    
     
