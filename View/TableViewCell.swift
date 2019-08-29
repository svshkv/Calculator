//
//  TableViewCell.swift
//  Calculator
//
//  Created by Саша Руцман on 28.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var fullTransferLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            fullTransferLabel.text = viewModel.fullTransfer
            dateLabel.text = viewModel.date
        }
    }
    
}
