//
//  ExtentionForMainScreenViewController.swift
//  fmh
//
//  Created: 14.05.22
//

import UIKit

extension MainScreenViewController {
    
    class HeaderView: UIView {
        
        enum HeaderType: Int {
            
            case news = 0
            case requests
            
            var title: String {
                var title: String = .init()
                switch self {
                case .news:
                    title = "Новости"
                case .requests:
                    title = "Просьбы"
                }
                return title
            }
            
            var titleBottomButton: String {
                var titleButton: String = .init()
                switch self {
                case .news:
                    titleButton = "ВСЕ НОВОСТИ"
                case .requests:
                    titleButton = "ВСЕ ПРОСЬБЫ"
                }
                return titleButton
            }
        }
        
        enum ButtonType {
            case info
            case add
            case hide
        }
        
        private var buttonTypes = [ButtonType]()
        
        private let type: HeaderType
        
        private let resultHeaderView = UIView()
        private let topHeaderView = UIView()
        private let resultFooterView = UIView()
        private let headerLabel = UILabel()
        
        private let infoButton = UIButton()
        private let addButton = UIButton()
        private let hideButton = UIButton()
        private var buttonsStack = UIStackView()
        private var topHeaderViewButtons = [UIButton]()
        
        private let showAllButton = UIButton()

        var pressAnyButton: ((HeaderType, Int) -> ())?
        
        init(frame: CGRect = .zero, type: HeaderType) {
            self.type = type
            super.init(frame: frame)
            
            switch type {
            case .news:
                self.topHeaderViewButtons = [self.infoButton, self.hideButton]
                self.buttonTypes = [.info, .hide]
            case .requests:
                self.topHeaderViewButtons = [self.infoButton, self.addButton, self.hideButton]
                self.buttonTypes = [.info, .add, .hide]
            }
            self.configureUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configureUI() {
            self.addSubview(self.resultHeaderView)
            self.resultHeaderView.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            self.resultHeaderView.addSubview(self.topHeaderView)
            self.topHeaderView.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
            
            self.resultHeaderView.addSubview(self.showAllButton)
            self.showAllButton.titleLabel?.font = setFont(font: (UIFont(name: "Avenir Next", size: 14)))
            self.showAllButton.setTitleColor(UIColor(red: 0, green: 0.6859514117, blue: 0.68581146, alpha: 1), for: .normal)
            self.showAllButton.setTitle(self.type.titleBottomButton, for: .normal)
            
            self.topHeaderView.addSubview(self.headerLabel)
            self.headerLabel.font = setFont(font: (UIFont(name: "Avenir Next", size: 18)))
            self.headerLabel.text = self.type.title
            
            self.topHeaderView.addSubview(self.infoButton)
            self.infoButton.setImage(UIImage(named: "Information"), for: .normal)
            
            self.topHeaderView.addSubview(self.addButton)
            self.addButton.setImage(UIImage(named: "Add"), for: .normal)
            
            self.topHeaderView.addSubview(self.hideButton)
            self.hideButton.setImage(UIImage(named: "ArrowUp"), for: .normal)
            
            self.topHeaderView.addSubview(self.buttonsStack)
            self.buttonsStack.axis = .horizontal
            self.buttonsStack.alignment = .fill
            self.buttonsStack.distribution = .fillEqually
            switch type {
            case .news, .requests:
                for button in self.topHeaderViewButtons {
                    self.topHeaderView.addSubview(button)
                    self.buttonsStack.addArrangedSubview(button)
                }
            }
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            self.resultHeaderView.frame = CGRect(x: 20, y: 0, width: self.bounds.width - 40, height: self.bounds.height)
            self.topHeaderView.frame = CGRect(x: 0, y: 0, width: self.bounds.width - 40, height: self.bounds.height / 2)
            self.headerLabel.frame = CGRect(x: 15, y: 2, width: self.bounds.width / 2, height: self.bounds.height / 2 - 4)
            self.showAllButton.frame = CGRect(x: self.bounds.width / 1.8, y: self.bounds.height / 2 + 10, width: self.bounds.width / 3, height: self.bounds.height / 3)
            
            self.buttonsStack.frame = CGRect(x: self.bounds.width - Double(self.buttonsStack.arrangedSubviews.count) * 44 - 40, y: 2, width: Double(self.buttonsStack.arrangedSubviews.count) * 44, height: 44)
        }
        
        @objc private  func buttonAction(_ button: UIButton) {
            pressAnyButton?(self.type, button.tag)
        }
    }
    
    fileprivate static func setFont(font: UIFont?) -> UIFont {
        if let font = font {
         return font
        } else {
            return UIFont()
        }
    }
}

extension MainScreenViewController {
    
    class FooterView: UIView {
        
        enum FooterType: Int {
            
            case news = 0
            case requests
        }
        
        private let type: FooterType
        
        private let footer = UIView()
        private let footerButton = UIButton()
        
        init(frame: CGRect = .zero, type: FooterType) {
            self.type = type
            super.init(frame: frame)
            switch type {
            case .news:
                self.footerButton.addTarget(self, action: #selector(showMoreNews), for: .touchUpInside)
                print("news")
            case .requests:
                self.footerButton.addTarget(self, action: #selector(showMoreRequests), for: .touchUpInside)
                print("requests")
            }
            self.footerConfigure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func footerConfigure() {
            self.addSubview(self.footer)
            self.footer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
           
            self.footer.addSubview(self.footerButton)
            self.footerButton.setTitleColor(UIColor(red: 0, green: 0.6331124306, blue: 0.623783648, alpha: 1), for: .normal)
            self.footerButton.setTitle("ПОКАЗАТЬ ЕЩЁ", for: .normal)
            self.footerButton.titleLabel?.font = setFont(font: (UIFont(name: "Avenir Next", size: 14)))
            
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            self.footer.frame = CGRect(x: 20, y: 0, width: self.bounds.width - 40, height: self.bounds.height)
            self.footerButton.frame = CGRect(x: frame.width / 5, y: 15, width: frame.width / 2, height: frame.height / 3)
        }
        
        @objc private func showMoreNews() {
            print("show more news")
        }
        
        @objc private func showMoreRequests() {
            print("show more requests")
        }
    }
    
}
