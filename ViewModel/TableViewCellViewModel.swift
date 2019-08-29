//
//  TableViewCellViewModel.swift
//  Calculator
//
//  Created by Саша Руцман on 28.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    var fullTransfer: String {
        return transfer.originalSystem + " -> " + transfer.resultSystem
    }
    
    var date: String {
        return String(describing: transfer.date)
    }
    
    private var transfer: Transfer
    
    
    init(transfer: Transfer) {
        self.transfer = transfer
    }
}
