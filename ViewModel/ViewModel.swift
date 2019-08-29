//
//  ViewModel.swift
//  Calculator
//
//  Created by Саша Руцман on 29.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import Foundation
import UIKit

class ViewModel {
    
    var transfers = [Transfer(originalSystem: "двоичная", resultSystem: "десятичная", date: Date()),
                     Transfer(originalSystem: "троичная", resultSystem: "десятичная", date: Date())]
    
    func tableViewViewModel(tableView: UITableView) -> TableViewViewModelType? {
        return TableViewViewModel(transfers: transfers)
    }
    
    var resultSystem: String?
    
    func calculateResult(originalSystemTextField: UITextField?) -> Void {
        
        guard let originalSystemTextField = originalSystemTextField, let numberOriginal = originalSystemTextField.text else { return }
        
        if numberOriginal == "" {
            resultSystem = ""
            return
        }
        
        resultSystem = String(describing: Int(numberOriginal)! * 2)
    }
    
    func exchangeSystems(originalButton: UIButton?, resultButton: UIButton?) -> Void {
        
        guard let originalButton = originalButton, let resultButton = resultButton else { return }
        let originalButtonTitle = originalButton.titleLabel?.text
        let resultButtonTitle = resultButton.titleLabel?.text
        originalButton.setTitle(resultButtonTitle, for: .normal)
        resultButton.setTitle(originalButtonTitle, for: .normal)
        
    }
    
    
}
