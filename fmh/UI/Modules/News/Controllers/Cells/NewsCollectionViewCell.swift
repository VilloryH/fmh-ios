//
//  NewsCollectionViewCell.swift
//  fmh
//
//  Created: 19.05.2022
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    //MARK: - Переопределяем isSelected чтоб вызывался updateAppearance после каждого выделения ячейки
    override var isSelected: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(labelDescription.heightToFitContent())
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
        print("required init?(coder: NSCoder) \(labelDescription.heightToFitContent())")
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - констрейнт для сжатого состояния
    private var collapsedConstraint: NSLayoutConstraint!
    
    //MARK: - констрейнт для расширенного состояния
    private var expandedConstraint: NSLayoutConstraint!
    
    private lazy var mainContainer = UIView()
    private lazy var topContainer = UIView()
    private lazy var middleContainer = UIView()
    private lazy var bottomContainer = UIView()

    private lazy var arrowUpDown: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Constant.Images.chevronDown)?.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = Constant.Collor.chevron
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var imageCategory: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .magenta
        return imageView
    }()
    
    var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Новостной заголовок"
        label.numberOfLines = 2
        label.font = Constant.Font.titleNews
        return label
    }()
    
    var labelDescription: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        label.backgroundColor = .white
        label.font = Constant.Font.descriptionNews
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
  
    var labelCategory: UILabel = {
        let label = UILabel()
        label.font = Constant.Font.holderTitle
        label.textColor = Constant.Collor.holderText
        label.alpha = 0
        label.text = "Праздник"
        return label
    }()
    
    var labelDate: UILabel = {
        let label = UILabel()
        label.font = Constant.Font.holder
        label.textColor = Constant.Collor.holderText
        label.backgroundColor = Constant.Collor.fillRectangel
        label.text = "22.12.2022"
        return label
    }()
    
    func configureCell() {
        mainContainer.clipsToBounds = true
        topContainer.backgroundColor = .white
        middleContainer.backgroundColor = .blue
        bottomContainer.backgroundColor = .yellow
        
        makeConstraint()
        updateAppearance()
        borderForCell()
        print("configureCell \(labelDescription.heightToFitContent())")
    }
    
    func makeConstraint() {
        contentView.addSubview(mainContainer)
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        mainContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        mainContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        mainContainer.addSubview(topContainer)
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        topContainer.leftAnchor.constraint(equalTo: mainContainer.leftAnchor).isActive = true
        topContainer.topAnchor.constraint(equalTo: mainContainer.topAnchor).isActive = true
        topContainer.rightAnchor.constraint(equalTo: mainContainer.rightAnchor).isActive = true
        topContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        mainContainer.addSubview(middleContainer)
        middleContainer.translatesAutoresizingMaskIntoConstraints = false
        middleContainer.leftAnchor.constraint(equalTo: mainContainer.leftAnchor).isActive = true
        middleContainer.rightAnchor.constraint(equalTo: mainContainer.rightAnchor).isActive = true
        middleContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor).isActive = true
        middleContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor).priority = .defaultLow
        ///middleContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        mainContainer.addSubview(bottomContainer)
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomContainer.leftAnchor.constraint(equalTo: mainContainer.leftAnchor).isActive = true
        bottomContainer.rightAnchor.constraint(equalTo: mainContainer.rightAnchor).isActive = true
        bottomContainer.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor).isActive = true
        bottomContainer.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        topContainer.addSubview(arrowUpDown)
        arrowUpDown.translatesAutoresizingMaskIntoConstraints = false
        arrowUpDown.rightAnchor.constraint(equalTo: topContainer.rightAnchor, constant: -20).isActive = true
        arrowUpDown.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true
        arrowUpDown.widthAnchor.constraint(equalToConstant: 20).isActive = true
        arrowUpDown.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //MARK: - Констрейнты для визуальных элементов ячейки
        topContainer.addSubview(imageCategory)
        imageCategory.translatesAutoresizingMaskIntoConstraints = false
        imageCategory.leftAnchor.constraint(equalTo: topContainer.leftAnchor, constant: 16).isActive = true
        imageCategory.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true
        imageCategory.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageCategory.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        topContainer.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.leftAnchor.constraint(equalTo: imageCategory.rightAnchor, constant: 16).isActive = true
        labelTitle.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true
        labelTitle.rightAnchor.constraint(equalTo: arrowUpDown.leftAnchor, constant: 32).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        middleContainer.addSubview(labelDescription)
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
//        labelDescription.center = CGPoint(x: middleContainer.bounds.midX, y: middleContainer.bounds.midY)
//        labelDescription.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        
        labelDescription.leftAnchor.constraint(equalTo: middleContainer.leftAnchor, constant: 16).isActive = true
        labelDescription.rightAnchor.constraint(equalTo: middleContainer.rightAnchor, constant: -16).isActive = true
        labelDescription.topAnchor.constraint(equalTo: middleContainer.topAnchor, constant: 8).isActive = true
        labelDescription.bottomAnchor.constraint(equalTo: middleContainer.bottomAnchor, constant: -8).isActive = true
        ///labelDescription.centerYAnchor.constraint(equalTo: middleContainer.centerYAnchor).isActive = true
        //labelDescription.heightAnchor.constraint(equalToConstant: labelDescription.heightToFitContent()).isActive = true
        print("dynamicHeight = \(labelDescription.heightToFitContent()) constraint")
        
        
        bottomContainer.addSubview(labelDate)
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.rightAnchor.constraint(equalTo: bottomContainer.rightAnchor).isActive = true
        labelDate.topAnchor.constraint(equalTo: bottomContainer.topAnchor).isActive = true
        labelDate.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor).isActive = true
        labelDate.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        bottomContainer.addSubview(labelCategory)
        labelCategory.translatesAutoresizingMaskIntoConstraints = false
        labelCategory.leftAnchor.constraint(equalTo: bottomContainer.leftAnchor, constant: 16).isActive = true
        labelCategory.topAnchor.constraint(equalTo: bottomContainer.topAnchor).isActive = true
        labelCategory.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor).isActive = true
        labelCategory.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        //MARK: - Констрейнт для сжатого состояния
        collapsedConstraint = topContainer.bottomAnchor.constraint(equalTo: bottomContainer.topAnchor)
        collapsedConstraint.priority = .defaultLow
        //MARK: - Констрейнт для расширенного состояния
        expandedConstraint = middleContainer.bottomAnchor.constraint(equalTo: bottomContainer.topAnchor)
        expandedConstraint.priority = .defaultLow
        
    }
    //MARK: - При выборе ячейки переключаем констрейнт и анимируем стрелку и подпись категории
    func updateAppearance() {
        collapsedConstraint.isActive = !isSelected
        expandedConstraint.isActive = isSelected
        print("updateAppearence \(labelDescription.heightToFitContent())")
        
        UIView.animate(withDuration: 0.3) {
            self.labelCategory.alpha = self.isSelected ? 1 : 0
            let upDown = CGAffineTransform(rotationAngle: .pi * -0.999)
            self.arrowUpDown.transform = self.isSelected ? upDown : .identity
        }
    }
    
    func borderForCell () {
        self.layer.borderColor = Constant.Collor.borderCell.cgColor
        self.layer.borderWidth = 1
    }
}
//MARK: - попытки получить высоту UIlabel
extension UILabel {

    func heightToFitContent() -> CGFloat {

        //self.numberOfLines = 0
        //self.lineBreakMode = NSLineBreakMode.byWordWrapping
        let maximumLabelSize : CGSize = CGSize(width: 340, height: CGFloat.greatestFiniteMagnitude)
        let expectedLabelSize : CGSize = self.sizeThatFits(maximumLabelSize);
        self.sizeToFit()
        print(expectedLabelSize.height)
        return expectedLabelSize.height
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}
