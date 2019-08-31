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
    
    
    
    
    init(post: Post, postImage: UIImage?) {
        self.post = post
        self.postImage = postImage
    }
    
}
