//
//  SystemsTableViewViewModel.swift
//  Calculator
//
//  Created by Саша Руцман on 29.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import Foundation
protocol SystemsTableViewViewModelType {
    
    func numberOfRows() -> Int
    
    func cellForSystemsTableView(indexPath: IndexPath) -> String
    
    func selectRow(atIndexPath: IndexPath) 
    
    func getSystem() -> String
    
    func setButton(id: Int)
    
    func getButton() -> Int
    
}
