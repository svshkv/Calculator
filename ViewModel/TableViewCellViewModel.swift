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
        let toIndex = transfer.date.index(transfer.date.startIndex, offsetBy: 4)
        return String(transfer.date[...toIndex])
    }
    
    private var transfer: Transfer
    
    
    init(transfer: Transfer) {
        self.transfer = transfer
    }
}
