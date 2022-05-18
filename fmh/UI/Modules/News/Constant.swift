//
//  Constant.swift
//  fmh
//
//  Created: 18.05.2022
//

import Foundation
import UIKit

struct Constant {
    
    struct Collor {
        static let text = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
        static let headerNews = UIColor(red: 0.917, green: 0.917, blue: 0.917, alpha: 1)
        static let headerSettingNews = UIColor(red: 0.892, green: 0.892, blue: 0.892, alpha: 1)
        static let borderCell = UIColor(red: 0.846, green: 0.846, blue: 0.846, alpha: 1)
        static let holderText = UIColor(red: 0.529, green: 0.529, blue: 0.529, alpha: 1)
        static let fillRectangel = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
    }
    
    struct Font {
        static let titleHeader = UIFont(name: "SFUIDisplay-Regular", size: 19)
        static let titleNews = UIFont(name: "SFNSDisplay-Regular", size: 16)
        static let descriptionNews = UIFont(name: "SFNSDisplay-Regular", size: 14)
        static let holder = UIFont(name: "SFNSDisplay-Regular", size: 13)
        static let holderTitle = UIFont(name: "SFNSDisplay-Regular", size: 13)
    }
    
    struct Test {
        static let testArray = ["1 новость","2 новость","3 новость", "4 новость","5 новость","6 новость", "7 новость","8 новость","9 новость", "10 новость","11 новость","12 новость"]
    }
}
