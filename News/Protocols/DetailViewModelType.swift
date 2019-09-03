//
//  DetailViewModelType.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewModelType {
    var post: Post? { get }
    var postImage: UIImage? { get }
    var blocks: [Blocks]? { get }
    var postAPI: String? { get set }
    var postImageAPI: String? { get set }
}
