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
        let index = getIndex(date: transfer.date)
        let toIndex = transfer.date.index(transfer.date.startIndex, offsetBy: index)
        return String(transfer.date[...toIndex])
    }
    
    private func getIndex(date: String) -> Int {
        var index = 0
        let transferArr = transfer.date.split(separator: ":")
        if transferArr[0].count == 1 && transferArr[1].count == 1 {
            index = 2
        } else if transferArr[0].count == 2 && transferArr[1].count == 2 {
            index = 4
        } else {
            index = 3
        }
        return index
    }
    
    private var transfer: Transfer
    
    
    init(transfer: Transfer) {
        self.transfer = transfer
    }
}
