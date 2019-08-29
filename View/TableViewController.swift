//
//  TableViewController.swift
//  Calculator
//
//  Created by Саша Руцман on 28.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.tableViewViewModel(tableView: historyTableView)?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as? TableViewCell
        
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.tableViewViewModel(tableView: historyTableView)!.cellViewModel(forIndexPath: indexPath)

        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }
    
    
}
