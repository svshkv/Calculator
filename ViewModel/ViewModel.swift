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
        
        resultSystem = String(String(describing: numberOriginal).binaryToOctal)
    }
    
    func exchangeSystems(originalButton: UIButton?, resultButton: UIButton?) -> Void {
        
        guard let originalButton = originalButton, let resultButton = resultButton else { return }
        let originalButtonTitle = originalButton.titleLabel?.text
        let resultButtonTitle = resultButton.titleLabel?.text
        originalButton.setTitle(resultButtonTitle, for: .normal)
        resultButton.setTitle(originalButtonTitle, for: .normal)
        
    }
    
    func systemsTableViewViewModel() -> SystemsTableViewViewModelType? {
        return SystemsTableViewViewModel()
    }
    
    
}

extension String {
    var hexaToInt      : Int    { return Int(strtoul(self, nil, 16))      }
    var hexaToDouble   : Double { return Double(strtoul(self, nil, 16))   }
    var hexaToBinary   : String { return String(hexaToInt, radix: 2)      }
    var decimalToHexa  : String { return String(Int(self) ?? 0, radix: 16)}
    var decimalToBinary: String { return String(Int(self) ?? 0, radix: 2) }
    var binaryToDecimalInt    : Int    { return Int(strtoul(self, nil, 2))       }
    var binaryToDecimalDouble : Double { return Double(strtoul(self, nil, 2))   }
    var binaryToHexa   : String { return String(binaryToDecimalInt, radix: 16)  }
    var binaryToOctal  : String { return String(binaryToDecimalInt, radix: 8)  }
    var binaryToTernary   : String { return String(binaryToDecimalInt, radix: 3)  }
}

extension Int {
    var binaryString: String { return String(self, radix: 2)  }
    var hexaString  : String { return String(self, radix: 16) }
    var doubleValue : Double { return Double(self) }
}
