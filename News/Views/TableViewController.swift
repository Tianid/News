//
//  ViewController.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    let reusableCell = "ReusableCell"
    var networkManager: NetworkManager?
    var tableViewModel: TableViewViewModelType?
    var unicCells: [Int]?
    var refresher: UIRefreshControl!
    private var api: String?
    private var apiPost: String?
    private var mediaAPI: String?

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if tabBarController?.selectedIndex == 0 {
            api = APIType.dtfAPI.rawValue
            apiPost = APIType.dtfAPIPost.rawValue
            mediaAPI = APIType.mediaAPI.rawValue
        } else {
            api = APIType.tjAPI.rawValue
            apiPost = APIType.tjAPIPost.rawValue
            mediaAPI = APIType.mediaAPI.rawValue
        }
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(refreshNewsPost), for: .valueChanged)
        myTableView.addSubview(refresher)
        
        tableViewModel = TableViewModel()
        tableViewModel?.apiURL = api
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
        tableViewModel?.apiURL = api
        refresher.endRefreshing()
    }
    
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = tableViewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let viewModel = tableViewModel else { return }
        if identifier == "showDetail" {
            if let dvc = segue.destination as? DetailViewController {
                dvc.viewModel = viewModel.viewModelForSelectedRow()
                dvc.viewModel?.postAPI = apiPost
                dvc.viewModel?.postImageAPI = mediaAPI
            }
        }
    }
}



