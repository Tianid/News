//
//  DTFViewModel.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation
import UIKit

class TableViewModel: TableViewViewModelType {
    private var ifAppJustStartedThenUpdate: Bool = true
    private var selectedIndexpath: IndexPath?
    
    var newLoads: [Int]?
    var posts: [Post]?
    var postImageData: [Int : UIImage]? = [:]
    
    var apiURL: String? {
        willSet {
            guard let value = newValue else { return }
            let networkManager = NetworkManager(url: value)
            networkManager.getNews(news: posts, postImageData: postImageData!) { [weak self] in
                if $0 != nil {
                    self?.posts = $0
                    print("POST COUNT - \(self?.posts?.count)")
                    if self!.ifAppJustStartedThenUpdate {
                        self!.updateTable!()
                        self!.ifAppJustStartedThenUpdate = !self!.ifAppJustStartedThenUpdate
                    }
                }
                guard let postImageData = $1 else { return }
                self?.postImageData = postImageData
                guard let newLoads = $2 else { return }
                self?.newLoads = newLoads
                let indexes = self?.prepareForRowUpdate()
                guard indexes!.count != 0 else { return }
                self!.updateRows!(indexes!)
                
            }
        }
    }
    
    var updateTable: (() -> ())?
    var updateRows: (([IndexPath]) -> ())?
    
    func numberOfRows() -> Int? {
        return posts?.count
    }
    
    func cellViewModel(forIndexPatth indexPath: IndexPath) -> TableViewCellViewModelType? {
        guard let post = posts?[indexPath.row] else { return TableViewCellViewModel() }
        guard let data = postImageData![post.id] else { return TableViewCellViewModel(post: post, postImageData: nil) }
        return TableViewCellViewModel(post: post, postImageData: data)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexpath else { return nil }
        return DetailViewModel()
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexpath = indexPath
    }
    
    func prepareForRowUpdate() -> [IndexPath] {
        var array: [IndexPath] = []
        for (index, post) in (posts?.enumerated())! {
            if (newLoads?.contains(post.id))! {
                array.append(IndexPath(row: index, section: 0))
            }
        }
        return array
    }
}
