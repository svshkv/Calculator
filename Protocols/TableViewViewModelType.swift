//
//  TableViewModelType.swift
//  Calculator
//
//  Created by Саша Руцман on 28.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import Foundation

protocol TableViewViewModelType {

    func numberOfRows() -> Int
    func cellViewModel(forIndexPath IndexPath: IndexPath) -> TableViewCellViewModelType?
    
}
