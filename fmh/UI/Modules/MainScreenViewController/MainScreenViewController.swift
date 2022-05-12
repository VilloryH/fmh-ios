//
//  Main_Screen_ViewController.swift
//  fmh
//
//  Created: 27.04.22
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    // MARK: - Временные переменные..
    
    let text = "text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news"
    
    var buttonOpenNewIsActive = false
    
    // MARK: - External vars
    
    var presenter: MainScreenPresenterDelegate?
    
    private let idNewsHeader  = "idNewsHeader"
    private let idNewsFooter = "idNewsFooter"
    private let idRequestHeader  = "idRequestHeader"
    private let idRequestFooter  = "idRequestFooter"
    
    private let cellNewsId = "cellNews"
    private let cellRequestsId = "cellRequests"
    private let titles = ["Новости", "Просьбы"]
    private let bottomButtons = ["ВСЕ НОВОСТИ", "ВСЕ ПРОСЬБЫ"]
    private let showMore = "ПОКАЗАТЬ ЕЩЕ"
    
    var cellNewsArray = 1
    var cellRequestsArray = 5
    
    private let tableview: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMain()
        
    }
    
    private func configureMain() {
        self.view.addSubview(UIImageView(image: UIImage(named: "MainBackground")))
        self.tableview.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        
        self.tableview.register(HeaderForCellNews.self, forHeaderFooterViewReuseIdentifier: idNewsHeader)
        self.tableview.register(FooterForCellNews.self, forHeaderFooterViewReuseIdentifier: idNewsFooter)
        self.tableview.register(HeaderForCellRequests.self, forHeaderFooterViewReuseIdentifier: idRequestHeader)
        self.tableview.register(FooterForCellRequests.self, forHeaderFooterViewReuseIdentifier: idRequestFooter)
        
        self.tableview.register(CellNews.self, forCellReuseIdentifier: cellNewsId)
        self.tableview.register(CellRequests.self, forCellReuseIdentifier: cellRequestsId)
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        setConstraints()
        
        self.title = "NAV_BAR"  //Временнный тайтл
    }
    
}

// MARK: - MainScreenViewControllerDelegate, UITableViewDelegate, UITableViewDataSourcee

extension MainScreenViewController: MainScreenViewControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return cellNewsArray
        case 1: return cellRequestsArray
        default: break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tableview.showsVerticalScrollIndicator = false
        
        let taskColor =  CGColor(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        let separateLine = UIColor.red
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellNewsId, for: indexPath) as! CellNews
            cell.openNewsButton.addTarget(self, action: #selector(openNews), for: .touchUpInside)
            
            self.buttonOpenNewIsActive ? (cell.newsTextLabel.text = text) : (cell.newsTextLabel.text = "")
            
            cell.newsTextLabel.numberOfLines = 0
            cell.newsTextLabel.sizeToFit()
            cell.contentView.isHidden = true
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellRequestsId, for: indexPath) as! CellRequests
            cell.configureCell(borderColor: taskColor, separateLine: separateLine)
            return cell
        default: break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return  UITableView.automaticDimension
        case 1: return 200
        default: break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idNewsHeader) as! HeaderForCellNews
            header.headerConfigure(name: titles[0], section: section, width: self.view.bounds.width, heigth: 40)
            header.headerBottomButton.setTitle(bottomButtons[0], for: .normal)
            return header
        case 1:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idRequestHeader) as! HeaderForCellRequests
            header.headerConfigure(name: titles[1], section: section, width: self.view.bounds.width, heigth: 40)
            header.headerBottomButton.setTitle(bottomButtons[1], for: .normal)
            return header
        default: break
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: idNewsFooter) as! FooterForCellNews
            footer.footerConfigure(width: self.view.bounds.width, heigth: 40)
            footer.footerButton.setTitle(showMore, for: .normal)
            return footer
        case 1:
            let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: idRequestFooter) as! FooterForCellRequests
            footer.footerConfigure(width: self.view.bounds.width, heigth: 40)
            footer.footerButton.setTitle(showMore, for: .normal)
            return footer
        default: break
        }
        return UIView()
    }
    
    @objc func openNews() {
        print("show current new")
        buttonOpenNewIsActive = !buttonOpenNewIsActive
        tableview.reloadData()
    }
    
}

extension MainScreenViewController {
    
    func setConstraints() {
        self.view.addSubview(tableview)
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}
