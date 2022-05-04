//
//  HeaderOfSections.swift
//  fmh
//
//  Created: 3.05.22
//

import UIKit

class HeaderTableViewCell: UITableViewHeaderFooterView {
    
    let headerLabel = UILabel()
    let resultHeader = UIView()
    let headerBottomButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0, green: 0.6331124306, blue: 0.623783648, alpha: 1), for: .normal)
        return button
    }()
    
    let footerButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0, green: 0.6331124306, blue: 0.623783648, alpha: 1), for: .normal)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not be implemented")
    }
    
    func headerConfigure(nameArray: [String], section: Int, width: CGFloat, heigth: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        self.headerLabel.frame = CGRect(x: 10, y: 3, width: width / 2, height: heigth)
        
        self.headerBottomButton.frame = CGRect(x: Int((width) / 1.8), y: Int(heigth) + 15, width: Int(width) / 2, height: Int(heigth) / 3)
        guard let font = UIFont(name: "Avenir Next", size: 12) else { return }
        headerBottomButton.titleLabel?.font = font
        headerBottomButton.addTarget(self, action: #selector(openSection), for: .touchUpInside)
        self.addSubview(headerBottomButton)
        
        self.resultHeader.frame = CGRect(x: 0, y: 0, width: width, height: heigth)
        self.resultHeader.backgroundColor =  #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
        self.resultHeader.addSubview(headerLabel)
        self.addSubview(resultHeader)
        
        self.headerLabel.text = nameArray[section]
    }
    
    @objc func openSection() {
        print("open section")
    }
    
    @objc func showMore() {
        print("showMore")
    }
    
}
 
