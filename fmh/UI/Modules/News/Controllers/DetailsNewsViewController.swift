//
//  SettingNewsViewController.swift
//  fmh
//
//  Created: 14.05.2022
//

import UIKit

class DetailsNewsViewController: UIViewController {
    
    //ячейка для динамического определения размеров содержимого ячейки
    private let sizingCell = DetailsNewsCollectionViewCell()

    //MARK: - Создаем CollectionView для множественного выбора обязательно используем allowsMultipleSelection
        private lazy var detailsNewsCollectionView: UICollectionView = {
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
        viewHeader.backgroundColor = ConstantNews.Collor.headerSettingNews
        self.view.addSubview(viewHeader)
        
        
        // News Label
        let newsLabel = UILabel()
        newsLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 22)
        newsLabel.textColor = .black
        newsLabel.font = ConstantNews.Font.titleHeader
        newsLabel.text = "Панель управления новостями"
        newsLabel.numberOfLines = 2
        newsLabel.textAlignment = .center
        let parentNewsLabel = viewHeader
        parentNewsLabel.addSubview(newsLabel)
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        newsLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        newsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        newsLabel.leadingAnchor.constraint(equalTo: parentNewsLabel.leadingAnchor, constant: 16).isActive = true
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
        
        configureView()
        
    }
    // MARK: - Configure collectionView
    func configureView() {
        detailsNewsCollectionView.backgroundColor = .clear
        detailsNewsCollectionView.register(DetailsNewsCollectionViewCell.self, forCellWithReuseIdentifier: "DetailsNewsCell")
        self.view.addSubview(detailsNewsCollectionView)
        detailsNewsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        detailsNewsCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        detailsNewsCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 55).isActive = true
        detailsNewsCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        detailsNewsCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
}
    
extension DetailsNewsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ConstantNews.Test.testArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsNewsCell", for: indexPath)
        return cell
    }
    
}

//MARK: - Расчет динамической ячейки
extension DetailsNewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let isSelected = collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false
//        /// Тут надо модельку прокидывать как и в cellForItemAt один в один
////        sizingCell.labelDescription.text = "dssafsdgsdgsd waergerg wefwefwe wefe weewr ew erger h ewrgq wq wqg gqg dgs g qgqwgqergr rg regerqg qrg qrg qrg erg reg erg erg erg erg "
//        sizingCell.frame = CGRect(
//            origin: .zero,
//            size: CGSize(
//                width: collectionView.bounds.width - 32,
//                height: 500))
//        sizingCell.isSelected = isSelected
//        sizingCell.setNeedsLayout()
//        sizingCell.layoutIfNeeded()
//        let size = sizingCell.systemLayoutSizeFitting(CGSize(width: collectionView.bounds.width - 32, height: .greatestFiniteMagnitude), withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
        
        
        
        return CGSize(width: collectionView.bounds.width - 32, height: 159)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 20, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}

//extension DetailsNewsViewController: UICollectionViewDelegate {
//    //MARK: - Переопределение анимации сворачивания ячейки
//    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        collectionView.performBatchUpdates(nil)
//        return true
//    }
//    //MARK: - Переопределение анимации разворачивания ячейки
//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
//        collectionView.performBatchUpdates(nil)
//        return true
//    }
//}


