//
//  HeaderFooterForCellRequests.swift
//  fmh
//
//  Created: 5.05.22
//

import UIKit

class HeaderForCellRequests: UITableViewHeaderFooterView {
    
    let headerLabel = UILabel()
    let resultHeader = UIView()
    let headerBottomButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0, green: 0.6331124306, blue: 0.623783648, alpha: 1), for: .normal)
        return button
    }()
    
    let addRequestButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setBackgroundImage(UIImage(named: "Add"), for: .normal)
        return button
    }()
    
    let informationRequests: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setBackgroundImage(UIImage(named: "Information"), for: .normal)
        return button
    }()
    
    let hideRequestsButtton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setBackgroundImage(UIImage(named: "ArrowUp"), for: .normal)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not be implemented")
    }
    
    func headerConfigure(name: String, section: Int, width: CGFloat, heigth: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        self.headerLabel.frame = CGRect(x: 15, y: 2, width: width / 2, height: heigth)
        self.headerLabel.textColor = .black
        
        self.headerBottomButton.frame = CGRect(x: Int((width) / 2.2), y: Int(heigth) + 15, width: Int(width) / 2, height: Int(heigth) / 3)
        guard let font = UIFont(name: "Avenir Next", size: 12) else { return }
        headerBottomButton.titleLabel?.font = font
        headerBottomButton.addTarget(self, action: #selector(showAllRequests), for: .touchUpInside)
        self.addSubview(headerBottomButton)
        
        self.addRequestButton.frame = CGRect(x: Int((width) - 148), y: 12, width: 17, height: 17)
        self.addRequestButton.addTarget(self, action: #selector(addRequest), for: .touchUpInside)
        resultHeader.addSubview(addRequestButton)
        
        self.informationRequests.frame = CGRect(x: Int((width) - 108), y: 12, width: 17, height: 17)
        self.informationRequests.addTarget(self, action: #selector(infoRequests), for: .touchUpInside)
        resultHeader.addSubview(informationRequests)
        
        self.hideRequestsButtton.frame = CGRect(x: Int((width) - 68), y: 15, width: 11, height: 8)
        hideRequestsButtton.addTarget(self, action: #selector(hideAllRequests), for: .touchUpInside)
        resultHeader.addSubview(hideRequestsButtton)
        
        self.resultHeader.frame = CGRect(x: 0, y: 0, width: width, height: heigth)
        self.resultHeader.backgroundColor =  #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
        self.resultHeader.addSubview(headerLabel)
        
        self.addSubview(resultHeader)
        
        self.headerLabel.text = name
    }
    
    @objc func addRequest() {
        print("add request")
    }
    
    @objc func infoRequests() {
        print("info about requests")
    }
    
    @objc func hideAllRequests() {
        print("hide all requests")
    }
    
    @objc func showAllRequests() {
        print("show all requests")
    }
    
}

class FooterForCellRequests: UITableViewHeaderFooterView {
    
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
    
    func footerConfigure(width: CGFloat, heigth: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: width, height: heigth))
        footer.addSubview(footerButton)
        footer.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        footerButton.frame = CGRect(x: Int((width) / 4.5), y: 15, width: Int(width) / 2, height: Int(heigth) / 3)
        guard let font = UIFont(name: "Avenir Next", size: 12) else { return }
        footerButton.titleLabel?.font = font
        footerButton.addTarget(self, action: #selector(showMoreRequests), for: .touchUpInside)
        
        self.addSubview(footer)
    }
    
    @objc func showMoreRequests() {
        print("show more requests")
    }
    
}
