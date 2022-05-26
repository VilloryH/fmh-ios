//
//  NewsViewController.swift
//  fmh
//
//  Created: 11.05.2022
//

import UIKit

class NewsViewController: UIViewController {
    //ячейка для динамического определения размеров содержимого ячейки
    private let sizingCell = NewsCollectionViewCell()
    
//MARK: - Создаем CollectionView для множественного выбора обязательно используем allowsMultipleSelection
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
        
        let imageViewBackground = UIImageView(image: UIImage(named: "BackGround"))
        imageViewBackground.frame = CGRect(origin: .zero, size: CGSize(width: self.view.bounds.width, height: self.view.bounds.height))
        imageViewBackground.clipsToBounds = true
        imageViewBackground.contentMode = .scaleToFill
        self.view.addSubview(imageViewBackground)
        
        // Header with button
        let viewHeader = UIView()
        viewHeader.frame = CGRect(origin: .zero, size: CGSize(width: self.view.bounds.width, height: 55))
        print(self.view.bounds)
        viewHeader.backgroundColor = ConstantNews.Collor.headerNews
        self.view.addSubview(viewHeader)
        
        
        // News Label
        let newsLabel = UILabel()
        newsLabel.frame = CGRect(x: 0, y: 0, width: 80, height: 22)
        newsLabel.textColor = .black
        newsLabel.font = ConstantNews.Font.titleHeader
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
        buttonEdit.addTarget(self, action: #selector(buttonDetailsAction), for: .touchUpInside)
        
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
        
        configureView()
    }

    //MARK: - Actions for buttonHeader
    
    @objc func buttonInfoAction(sender: UIButton) {
        print("button Info")
        // add alert info
    }
    
    @objc func buttonDetailsAction() {
        let detailsNewsVC = DetailsNewsViewController()
        //let generalVC = GeneralViewController()
        navigationController?.pushViewController(detailsNewsVC, animated: true)
        //generalVC.showViewController(viewController: detailsNewsVC)
        
    }
    
    // MARK: - Configure collectionView
    
    func configureView() {
        newsCollectionView.backgroundColor = .clear
        newsCollectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: "NewsCell")
        self.view.addSubview(newsCollectionView)
        newsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        newsCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        newsCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 55).isActive = true
        newsCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        newsCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
}

//MARK: - Extension for CollectionView

extension NewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ConstantNews.Test.testArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCollectionViewCell
        print("cellForItemAt")
        cell.labelDescription.text = "dssafsdgsdgsd waergerg wefwefwe wefe weewr ew erger h ewrgq wq wqg gqg dgs g qgqwgqergr rg regerqg qrg qrg qrg erg reg erg erg erg erg "
        return cell
    }
        
}

extension NewsViewController: UICollectionViewDelegate {
    //MARK: - Переопределение анимации сворачивания ячейки
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionView.performBatchUpdates(nil)
        return true
    }
    //MARK: - Переопределение анимации разворачивания ячейки
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
        collectionView.performBatchUpdates(nil)
        return true
    }
}
//MARK: - Расчет динамической ячейки
extension NewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isSelected = collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false
        /// Тут надо модельку прокидывать как и в cellForItemAt один в один
        sizingCell.labelDescription.text = "dssafsdgsdgsd waergerg wefwefwe wefe weewr ew erger h ewrgq wq wqg gqg dgs g qgqwgqergr rg regerqg qrg qrg qrg erg reg erg erg erg erg "
        sizingCell.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: collectionView.bounds.width - 32,
                height: 500))
        sizingCell.isSelected = isSelected
        sizingCell.setNeedsLayout()
        sizingCell.layoutIfNeeded()
        let size = sizingCell.systemLayoutSizeFitting(CGSize(width: collectionView.bounds.width - 32, height: .greatestFiniteMagnitude), withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 20, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return -1
    }
}
  



    
    
    
     

