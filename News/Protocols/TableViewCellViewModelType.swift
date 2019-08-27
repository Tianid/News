//
//  TableViewCellViewModelType.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewCellViewModelType: class {
    var id: Int { get }
    var date: String { get }
    var intro: String { get }
    var title: String { get }
    var blocks: [Blocks] { get }
    var cover: Cover? { get }
    var postImage: UIImage? { get }
    var additionalData: AdditionalData? { get }
}
