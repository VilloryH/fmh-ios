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
        static let chevron = UIColor(red: 0, green: 0, blue: 0, alpha: 0.54)
    }
    
    struct Font {
        static let titleHeader = UIFont(name: "Helvetica Neue", size: 19)
        static let titleNews = UIFont(name: "Helvetica Neue", size: 16)
        static let descriptionNews = UIFont(name: "Helvetica Neue", size: 14)
        static let holder = UIFont(name: "Helvetica Neue", size: 13)
        static let holderTitle = UIFont(name: "Helvetica Neue", size: 12)
    }
    
    struct Images {
        static let chevronUp = "chevron.up"
        static let chevronDown = "chevron.down"
    }
    
    struct Test {
        static let testArray = [News(createDate: 1, creatorId: 1, creatorName: "dsf", description: "sgagreregergrergerger rg erg erg eg erg erg erg ", id: 3, newsCategoryId: 3, publishDate: 3, publishEnabled: true, title: "cnsdjvsdj sdff"), News(createDate: 1, creatorId: 1, creatorName: "dsf", description: "sgagreregergrergerger rg erg erg eg erg erg erg ", id: 3, newsCategoryId: 3, publishDate: 3, publishEnabled: true, title: "cnsdjvsdj sdff"), News(createDate: 1, creatorId: 1, creatorName: "dsf", description: "sgagreregergrergerger rg erg erg eg erg erg erg ", id: 3, newsCategoryId: 3, publishDate: 3, publishEnabled: true, title: "cnsdjvsdj sdff"), News(createDate: 1, creatorId: 1, creatorName: "dsf", description: "sgagreregergrergerger rg erg erg eg erg erg erg ", id: 3, newsCategoryId: 3, publishDate: 3, publishEnabled: true, title: "cnsdjvsdj sdff"), News(createDate: 1, creatorId: 1, creatorName: "dsf", description: "sgagreregergrergerger rg erg erg eg erg erg erg ", id: 3, newsCategoryId: 3, publishDate: 3, publishEnabled: true, title: "cnsdjvsdj sdff"), News(createDate: 1, creatorId: 1, creatorName: "dsf", description: "sgagreregergrergerger rg erg erg eg erg erg erg ", id: 3, newsCategoryId: 3, publishDate: 3, publishEnabled: true, title: "cnsdjvsdj sdff") ]
    }
}
