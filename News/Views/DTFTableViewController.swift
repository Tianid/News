//
//  ViewController.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import UIKit

class DTFTableViewController: UIViewController {
    
    let reusableCell = "ReusableCell"
    var networkManager: NetworkManager?
    var tableViewModel: TableViewViewModelType?
    var unicCells: [Int]?
    var refresher: UIRefreshControl!

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(refreshNewsPost), for: .valueChanged)
        myTableView.addSubview(refresher)
        
        tableViewModel = TableViewModel()
        tableViewModel?.apiURL = APIType.dtfAPI.rawValue
        tableViewModel?.updateTable = {
            DispatchQueue.main.async {
                self.myTableView.reloadSections(IndexSet(integer: .zero), with: .fade)
                print("TABEL WAS RELOADED!!!!!!!!!!!!!!!!!!")
            }
        }
        
        tableViewModel?.updateRows = {[weak self] indexes in
            DispatchQueue.main.async {
                print(self!.myTableView.numberOfRows(inSection: 0), "- NUMBER OF ROWS")
                print(self!.tableViewModel?.postImageData!.count,"- postImageData COUNT")
                print(self!.tableViewModel?.posts?.count, "- POSTS COUNT")
                if self!.myTableView.numberOfRows(inSection: 0) < (self!.tableViewModel?.posts?.count)! {
                    self!.myTableView.insertRows(at: indexes, with: .fade)
                    print("ROWS WAS INSERTED!!!!!!!!!!!!!!!!!!")
                } else {
                    self!.myTableView.reloadRows(at: indexes, with: .automatic)
                    print("ROWS WAS RELOADED!!!!!!!!!!!!!!!!!!")
                }
            }
        }
        myTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: self.reusableCell)

        // Do any additional setup after loading the view.
    }
    
    @objc func refreshNewsPost() {
        print(" REFRESHING ")
        tableViewModel?.apiURL = APIType.dtfAPI.rawValue
        refresher.endRefreshing()
    }
    
}

extension DTFTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: self.reusableCell, for: indexPath) as? MyTableViewCell
        
        
        guard let tableViewCell = cell, let viewModel = tableViewModel else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPatth: indexPath)
        tableViewCell.selectionStyle = .none
        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }
}


