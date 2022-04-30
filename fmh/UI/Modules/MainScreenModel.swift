//
//  MainScreenModel.swift
//  fmh
//
//  Created: 26.04.22
//

import Foundation
import UIKit

struct MainScreenModel {
    var news: News
    var requests: Requests
    
}

struct News {
    var title: String?
    var text: String?
    var icon: UIImage?
    var date: Date?
    
}

struct Requests {
    var topic: String?
    var patient: String?
    var executor: String?
    var plannedDate: Date?
}

//var test = MainScreenModel(news: News(), applications: Application())
