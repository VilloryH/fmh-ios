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
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NavBar"
       // configureNavBar()
        
        
        // Do any additional setup after loading the view.
    }


    }
        
    private func configureTableview() {
   
    }

// MARK: - Drop_Dawn_List_ModuleDelegate
extension MainScreenViewController: MainScreenViewControllerDelegate {
    
}


//private func configureNavBar() {
//    self.navigationController?.navigationBar.backgroundColor = navBarButtonColor
//    for item in navBarButtonNames {
//        navBarButtons.append(createButton(image: item))
//    }
//    self.navigationController?.navigationBar.topItem?.leftBarButtonItems = navBarButtons
//}
//
//private func createButton(image: String) -> UIBarButtonItem {
//    let button = UIBarButtonItem()
//    button.image = UIImage(named: image)
//
//    return button
//}

//private func configureNavBar() {
//    self.navigationController?.navigationBar.backgroundColor = navBarButtonColor
//
//    for item in navBarButtonNames {
//        navBarButtons.append(createButton(image: item))
//    }
//    self.navigationItem.leftBarButtonItems = navBarButtons
//}
//
//private func createButton(image: String) -> UIBarButtonItem {
//    let button = UIBarButtonItem()
//    button.image = UIImage(named: image)
//    //button.tintColor = UIColor.white
//    return button
//}
