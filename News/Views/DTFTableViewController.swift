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

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewModel = TableViewModel()
        tableViewModel?.apiURL = APIType.dtfAPI.rawValue
        tableViewModel?.updateTable = {
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
        myTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: self.reusableCell)

        // Do any additional setup after loading the view.
    }
}

extension DTFTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tableViewModel?.numberOfRows() ?? 0
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
