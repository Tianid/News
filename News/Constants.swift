//
//  Constants.swift
//  News
//
//  Created by Tianid on 22/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation


public let tjAPI = "https://api.tjournal.ru/"
public let vcAPI = "https://api.vc.ru/v1.8/"
public let dtfAPI = "https://api.dtf.ru/v1.8/timeline/mainpage/recent"


enum APIType: String {
    case tjAPI = "https://api.tjournal.ru/"
    case vcAPI = "https://api.vc.ru/v1.8/"
    case dtfAPI = "https://api.dtf.ru/v1.8/timeline/mainpage/recent"
    case dtfAPIPost = "https://api.dtf.ru/v1.8/entry/65622"
    case dtfAPINext = "https://api.dtf.ru/v1.8/timeline/gamedev/indie/recent"
    
}

