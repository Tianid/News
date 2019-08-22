//
//  TableViewCellViewModelType.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation

protocol TableViewCellViewModelType: class {
    var date: String { get }
    var intro: String { get }
    var title: String { get }
}
