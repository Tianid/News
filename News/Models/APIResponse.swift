//
//  APIResponse.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation

struct News: Codable {
    let message: String
    let result: [Post]
    
}

struct Post: Codable {
    let id: Int
    let title: String
    let date: Date
    let dateRFC: String
    let intro: String
    let cover: Cover?
}

struct Cover: Codable {
//    let additionalData: AdditionalData
    let thumbnailUrl: String
    let type: Int
    let url: String
    let size_simple: String
    
}

//struct AdditionalData: Codable {
//    let type: String
////    let url: String
//    let size: String?
//}
