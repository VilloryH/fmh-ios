//
//  Main_Screen_ViewController.swift
//  fmh
//
//  Created: 27.04.22
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    // MARK: - External vars
    var presenter: MainScreenPresenterDelegate?
    
    private let idNewsHeaderFooter  = "idNewsHeaderFooter"
    private let idRequestHeaderFooter  = "idRequestHeaderFooter"
    
    private let cellNewsId = "cellNews"
    private let cellRequestsId = "cellRequests"
    private let titles = ["Новости", "Просьбы"]
    private let bottomButtons = ["ВСЕ НОВОСТИ", "ВСЕ ПРОСЬБЫ"]
    private let showMore = "ПОКАЗАТЬ ЕЩЕ"
    
    let taskColor =  CGColor(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    let separateLine = UIColor.red
    
    var cellNewsArray = 3
    var cellRequestsArray = 5
    
    private let tableview: UITableView = {
        let tableview = UITableView()
        //tableview.bounces = false
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundMainScreen()
        configureMain()
    }
    
    private func setBackgroundMainScreen() {
        self.view.addSubview(UIImageView(image: UIImage(named: "MainBackground")))
    }
    
    private func configureMain() {
        self.tableview.backgroundView = UIImageView(image: UIImage(named: "MainBackground"))
        
        self.tableview.register(HeaderFooterForCellNews.self, forHeaderFooterViewReuseIdentifier: idNewsHeaderFooter)
        self.tableview.register(HeaderFooterForCellRequests.self, forHeaderFooterViewReuseIdentifier: idRequestHeaderFooter)
        
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
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellNewsId, for: indexPath) as! CellNews
            cell.backgroundColor = .white
            cell.setConstraints()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellRequestsId, for: indexPath) as! CellRequests
            cell.backgroundColor = .white
            cell.configureCell(borderColor: taskColor, separateLine: separateLine)
            return cell
        default: break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 70
        case 1: return 200
        default: break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idNewsHeaderFooter) as! HeaderFooterForCellNews
            header.headerConfigure(name: titles[0], section: section, width: self.view.bounds.width, heigth: 40)
            header.headerBottomButton.setTitle(bottomButtons[0], for: .normal)
            return header
        case 1:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idRequestHeaderFooter) as! HeaderFooterForCellRequests
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
            let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: idNewsHeaderFooter) as! HeaderFooterForCellNews
            footer.footerConfigure(width: self.view.bounds.width, heigth: 40)
            footer.footerButton.setTitle(showMore, for: .normal)
            return footer
        case 1:
            let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: idRequestHeaderFooter) as! HeaderFooterForCellRequests
            footer.footerConfigure(width: self.view.bounds.width, heigth: 60)
            footer.footerButton.setTitle(showMore, for: .normal)
            return footer
        default: break
        }
        return UIView()
    }
}

extension MainScreenViewController {
    
    func setConstraints() {
        self.view.addSubview(tableview)
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
