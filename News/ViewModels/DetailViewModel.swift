//
//  DetailViewModel.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation
import UIKit

class DetailViewModel: DetailViewModelType {
    
    
    
    var post: Post?
    var postImage: UIImage?
    var blocks: [Blocks]? {
        return post?.blocks
    }
    var postAPI: String?
    var postImageAPI: String?
    
    init(post: Post, postImage: UIImage?) {
        self.post = post
        self.postImage = postImage
    }
    
}
