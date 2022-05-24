//
//  Main_Screen_ViewController.swift
//  fmh
//
//  Created: 27.04.22
//

import UIKit


final class MainScreenViewController: UIViewController {
    
    // MARK: - Временные переменные..
    
    let testText = "text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news -- text of news"
    
    
    
    // MARK: - External vars
    
    var presenter: MainScreenPresenterDelegate?
    
    // MARK:: - Internal vars
    
    private let idNewsHeader  = "idNewsHeader"
    private let idNewsFooter = "idNewsFooter"
    private let idRequestHeader  = "idRequestHeader"
    private let idRequestFooter  = "idRequestFooter"
    
    private let cellNewsId = "cellNews"
    private let cellRequestsId = "cellRequests"
    private let titles = ["Новости", "Просьбы"]
    
    let handlerView: HeaderView? = nil
    
    var buttonOpenNewIsActive = false
    
    var cellNewsArrayCount = 2
    var cellRequestsArrayCount = 3
    
    private let tableview = UITableView()
    
    var newsText: ((String) -> ())? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMain()
    }
    
    private func configureMain() {
        self.view.addSubview(UIImageView(image: UIImage(named: "MainBackground")))
        self.tableview.backgroundColor = UIColor(white: 0.0, alpha: 0.0)

        self.tableview.register(CellNews.self, forCellReuseIdentifier: cellNewsId)
        self.tableview.register(CellRequests.self, forCellReuseIdentifier: cellRequestsId)
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        setConstraints()
        self.tableview.rowHeight = UITableView.automaticDimension
        
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
        case 0: return cellNewsArrayCount
        case 1: return cellRequestsArrayCount
        default: break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellNewsId, for: indexPath) as! CellNews
            self.buttonOpenNewIsActive ? ( cell.updateText(text: testText, image: "ArrowUp")) : ( cell.updateText(text: "", image: "ArrowDown"))
            cell.layer.borderWidth = 1
            cell.layer.borderColor =  #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellRequestsId, for: indexPath) as! CellRequests
            
            return cell
        default: break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return 200
        default: break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        buttonOpenNewIsActive = !buttonOpenNewIsActive
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerType = HeaderView.HeaderType(rawValue: section) else { return nil }
        let header = HeaderView(type: headerType)
        header.pressUpButton = { (type, tag) in
            print(type)
            print(tag)
        }
        header.pressDownButton = { type in
            print(type)
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerType = FooterView.FooterType(rawValue: section) else { return nil }
        let footer = FooterView(type: footerType)
        return footer
    }
    
}

extension MainScreenViewController {
    
    func setConstraints() {
        self.view.addSubview(self.tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            self.tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            self.tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            self.tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}

