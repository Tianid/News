//
//  TableViewCellViewModel.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation
import UIKit

class TableViewCellViewModel: TableViewCellViewModelType {

    
    

    private var post: Post?
    
    var id: Int {
        guard let post = post else { return -1}
        return post.id
    }
    
    var date: String {
        guard let post = post else { return String()}
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC+3")
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm"
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:s"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        
        return dateFormatter.string(for: Date(timeIntervalSince1970: TimeInterval(post.date)))!
    }
    
    var intro: String {
        guard let post = post else { return String()}
        return post.intro
    }
    
    var title: String {
        guard let post = post else { return String()}
        return post.title
    }
    
    var blocks: [Blocks] {
        guard let post = post else { return [Blocks(type: String(), data: DataAPI(text: nil, text_truncated: nil ), cover: false)]}
        return post.blocks
    }
    
    var cover: Cover? {
        guard let post = post else { return nil }
        return post.cover
    }
    
    var postImage: UIImage?
    
    var additionalData: AdditionalData? {
        guard let post = post else { return nil }
        return post.cover?.additionalData
    }
    
    init(post: Post? = nil, postImageData: UIImage? = nil) {
        self.post = post
        self.postImage = postImageData
    }
}
