//
//  TableViewCellViewModel.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation


class TableViewCellViewModel: TableViewCellViewModelType {
    
    private var post: Post?
    
    var date: String {
        guard let post = post else { return String()}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss"
        return dateFormatter.string(for: post.date)!
    }
    
    var intro: String {
        guard let post = post else { return String()}
        return post.intro
    }
    
    var title: String {
        guard let post = post else { return String()}
        return post.title
    }
    
    init(post: Post? = nil) {
        self.post = post
    }
}
