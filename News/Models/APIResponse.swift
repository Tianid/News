//
//  APIResponse.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

/* MARK: - "blocks" field in json -> field "cover" if true show into else not show
 - Data string incorrect parse (alway 2050 year showed)
 - Parsing text with tags
 */

import Foundation

struct News: Codable {
    let message: String
    let result: [Post]
    
}

struct Post: Codable{
    
    
    let id: Int
    let title: String
    let date: Int
    let dateRFC: String
    let intro: String
    let cover: Cover?
    let blocks: [Blocks]
    var postImage: Data?
}

struct Cover: Codable {
    let additionalData: AdditionalData?
    let thumbnailUrl: String
    let type: Int
    let url: String // post Image
    let size_simple: String
    
}

struct Blocks: Codable {
    
    
    let type: String
    let data: DataAPI
    let cover: Bool
}

struct DataAPI: Codable  {
   
    let text: String?
    let text_truncated: String?
    
    
}

struct AdditionalData: Codable {
    let type: String
//    let url: String
    let size: Int?
}
