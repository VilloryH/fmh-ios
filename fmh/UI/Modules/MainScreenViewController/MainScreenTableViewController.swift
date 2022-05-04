//
//  Main_Screen_ViewController.swift
//  fmh
//
//  Created: 27.04.22
//

import UIKit

final class MainScreenTableViewController: UITableViewController {
    
    // MARK: - External vars
    var presenter: MainScreenPresenterDelegate?
    
    private let idMainHeader  = "idMainHeader"
    private let cellNewsId = "cellNews"
    private let cellRequestsId = "cellRequests"
    private let titles = ["Новости", "Просьбы"]
    private let bottomButtons = ["ВСЕ НОВОСТИ", "ВСЕ ПРОСЬБЫ"]
    var cellNewsArray = 3
    var cellRequestsArray = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMain()
    }
    
    private func configureMain() {
        self.tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: idMainHeader)
        self.tableView.register(CellNews.self, forCellReuseIdentifier: cellNewsId)
        self.tableView.register(CellRequests.self, forCellReuseIdentifier: cellRequestsId)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let background = UIImageView(image: UIImage(named: "MainBackground"))
        self.tableView.backgroundView = background
        self.title = "NAV_BAR"  //Временнный тайтл
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return cellNewsArray
        case 1: return cellRequestsArray
        default: break
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellNewsId, for: indexPath) as! CellNews
            cell.setConstraints()
            //cellNewsArray.append(cell)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellRequestsId, for: indexPath) as! CellRequests
            cell.setConstraints()
            //cellRequestsArray.append(cell)
            return cell
        default: break
        }
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 70
        case 1: return 200
        default: break
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idMainHeader) as! HeaderTableViewCell
        header.headerConfigure(nameArray: titles, section: section, width: self.view.bounds.width, heigth: 40)
        header.headerBottomButton.setTitle(bottomButtons[section], for: .normal)
        return header
    }
    
}

// MARK: - Drop_Dawn_List_ModuleDelegate
extension MainScreenTableViewController: MainScreenTableViewControllerDelegate {
    
}
