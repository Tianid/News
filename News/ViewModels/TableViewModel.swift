//
//  DTFViewModel.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation


class TableViewModel: TableViewViewModelType {
    
    private var posts: [Post]?
    var apiURL: String? {
        willSet {
            guard let value = newValue else { return }
            let networkManager = NetworkManager(url: value)
            networkManager.getNews { [weak self] in
                self?.posts = $0
                self!.isNeededToReloadTable = !self!.isNeededToReloadTable
            }
        }
    }
    
    var isNeededToReloadTable: Bool = false {
        willSet {
            if newValue {
                guard let update = updateTable else { return }
//                isNeededToReloadTable = !isNeededToReloadTable!
                update()
            }
        }
    }
    var updateTable: (() -> ())?
    
    private var selectedIndexpath: IndexPath?
    
    func numberOfRows() -> Int? {
        return posts?.count
    }
    
    func cellViewModel(forIndexPatth indexPath: IndexPath) -> TableViewCellViewModelType? {
        guard let post = posts?[indexPath.row] else { return TableViewCellViewModel() }
        return TableViewCellViewModel(post: post)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexpath else { return nil }
        return DetailViewModel()
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexpath = indexPath
    }
}
