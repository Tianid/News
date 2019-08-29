//
//  TableViewViewModelType.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewViewModelType {
    var apiURL: String? { get set }
    var updateTable: (() -> ())? { get set }
    var updateRows: (([IndexPath]) -> ())? { get set }
    
    var posts: [Post]? { get }
    var postImageData: [Int:UIImage]? { get }
    
    func numberOfRows() -> Int?
    func cellViewModel(forIndexPatth indexPath: IndexPath) -> TableViewCellViewModelType?
    
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
