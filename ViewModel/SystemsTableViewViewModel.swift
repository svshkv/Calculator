//
//  SystemsTableViewViewModel.swift
//  Calculator
//
//  Created by Саша Руцман on 29.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import Foundation
import UIKit

class SystemsTableViewViewModel: SystemsTableViewViewModelType {
    
    private var fromButton: Int?
    private var selectedIndexPath: IndexPath?
    
    private let systems = [Systems.Binary, Systems.Ternary, Systems.Octal, Systems.Decimal, Systems.Hexadecimal]
    
    func numberOfRows() -> Int {
        return systems.count
    }
    
    func cellForSystemsTableView(indexPath: IndexPath) -> String{
        return systems[indexPath.row].rawValue
    }
    
    func selectRow(atIndexPath: IndexPath) {
        self.selectedIndexPath = atIndexPath
    }
    
    func getSystem() -> String {
        guard let selectedIndexPath = selectedIndexPath else { return " " }
        return systems[selectedIndexPath.row].rawValue
    }
    
    func setButton(id: Int) {
        fromButton = id
    }
    
    func getButton() -> Int {
        guard let fromButton = fromButton else { return 3}
        return fromButton
    }
    
    
    
}
