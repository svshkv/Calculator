//
//  ViewModel.swift
//  Calculator
//
//  Created by Саша Руцман on 28.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class TableViewViewModel: TableViewViewModelType {
    
    private let transfers: Results<Transfer>
    
    func cellViewModel(forIndexPath IndexPath: IndexPath) -> TableViewCellViewModelType? {
        let transfer = transfers[IndexPath.row]
        return TableViewCellViewModel(transfer: transfer)
    }
    
    
    func numberOfRows() -> Int {
        return transfers.count
    }
    
    
    init(transfers: Results<Transfer>) {
        self.transfers = transfers
    }
    

}
