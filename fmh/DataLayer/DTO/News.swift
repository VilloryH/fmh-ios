//
//  News.swift
//  fmh
//
//  Created: 22.05.2022
//

import Foundation

struct News: Codable {
    let createDate: Int
    let creatorId: Int
    let creatorName: String
    let description: String
    let id: Int
    let newsCategoryId: Int
    let publishDate: Int
    let publishEnabled: Bool
    let title: String
    
}
