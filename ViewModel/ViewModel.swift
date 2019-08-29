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
    
    func calculateResult(originalSystemTextField: UITextField?, originalButton: UIButton?, resultButton: UIButton?) -> Void {
        
        guard let originalSystemTextField = originalSystemTextField, let numberOriginal = originalSystemTextField.text, let originalButton = originalButton, let resultButton = resultButton else { return }
        
        if numberOriginal == "" {
            resultSystem = ""
            return
        }
        
        let numberString = originalSystemTextField.text
        let result = Systems(rawValue: (resultButton.titleLabel?.text)!)
        let original = Systems(rawValue: (originalButton.titleLabel?.text)!)
        
        switch original {
            case .Binary:
                switch result {
                    case .Binary:
                        resultSystem = numberString
                    case .Ternary:
                        resultSystem = numberString?.binaryToTernary
                    case .Octal:
                        resultSystem = numberString?.binaryToOctal
                    case .Decimal:
                        resultSystem = numberString?.binaryToDecimalString
                    case .Hexadecimal:
                        resultSystem = numberString?.binaryToHexa
            }
            case .Ternary:
                switch result {
                    case .Binary:
                        resultSystem = numberString?.ternaryToBinary
                    case .Ternary:
                        resultSystem = numberString
                    case .Octal:
                        resultSystem = numberString?.ternaryToOctal
                    case .Decimal:
                        resultSystem = numberString?.ternaryToDecimalString
                    case .Hexadecimal:
                        resultSystem = numberString?.ternaryToHexa
            }
            case .Octal:
                switch result {
                case .Binary:
                    resultSystem = numberString?.OctalToBinary
                case .Ternary:
                    resultSystem = numberString?.OctalToTernary
                case .Octal:
                    resultSystem = numberString
                case .Decimal:
                    resultSystem = numberString?.OctalToDecimalString
                case .Hexadecimal:
                    resultSystem = numberString?.OctalToHexa
            }
            case .Decimal:
                switch result {
                    case .Binary:
                    resultSystem = numberString?.decimalToBinary
                    case .Ternary:
                    resultSystem = numberString?.decimalToTernary
                    case .Octal:
                    resultSystem = numberString?.decimalToOctal
                    case .Decimal:
                    resultSystem = numberString
                    case .Hexadecimal:
                    resultSystem = numberString?.decimalToHexa
            }
            case .Hexadecimal:
                switch result {
                case .Binary:
                    resultSystem = numberString?.hexaToBinary
                case .Ternary:
                    resultSystem = numberString?.hexaToTernary
                case .Octal:
                    resultSystem = numberString?.hexaToOctal
                case .Decimal:
                    resultSystem = numberString?.hexaToString
                case .Hexadecimal:
                    resultSystem = numberString
            }
        }
    }
    
    func exchangeSystems(originalSystemTextField: UITextField?, resultSystemTextField: UITextField?, originalButton: UIButton?, resultButton: UIButton?) -> Void {
        
        guard let originalButton = originalButton, let resultButton = resultButton, let originalSystemTextField = originalSystemTextField, let resultSystemTextField = resultSystemTextField else { return }
        let originalButtonTitle = originalButton.titleLabel?.text
        let resultButtonTitle = resultButton.titleLabel?.text
        let originalSystemTextFieldText = originalSystemTextField.text
        let resultSystemTextFieldText = resultSystemTextField.text
        originalButton.setTitle(resultButtonTitle, for: .normal)
        resultButton.setTitle(originalButtonTitle, for: .normal)
        originalSystemTextField.text = resultSystemTextFieldText
        resultSystemTextField.text = originalSystemTextFieldText
        
    }
    
    func systemsTableViewViewModel() -> SystemsTableViewViewModelType? {
        return SystemsTableViewViewModel()
    }
    
    
}

extension String {
    
    var hexaToInt      : Int    { return Int(strtoul(self, nil, 16))      }
    var hexaToDouble   : Double { return Double(strtoul(self, nil, 16))   }
    var hexaToString    : String    { return String(strtoul(self, nil, 16))      }
    var hexaToBinary   : String { return String(hexaToInt, radix: 2)      }
    var hexaToTernary   : String { return String(hexaToInt, radix: 3)      }
    var hexaToOctal   : String { return String(hexaToInt, radix: 8)      }
    
    var decimalToHexa  : String { return String(Int(self) ?? 0, radix: 16)}
    var decimalToBinary: String { return String(Int(self) ?? 0, radix: 2) }
    var decimalToTernary: String { return String(Int(self) ?? 0, radix: 3) }
    var decimalToOctal: String { return String(Int(self) ?? 0, radix: 8) }
    
    var binaryToDecimalInt    : Int    { return Int(strtoul(self, nil, 2))       }
    var binaryToDecimalDouble : Double { return Double(strtoul(self, nil, 2))   }
    var binaryToDecimalString : String { return String(strtoul(self, nil, 2))   }
    var binaryToHexa   : String { return String(binaryToDecimalInt, radix: 16)  }
    var binaryToOctal  : String { return String(binaryToDecimalInt, radix: 8)  }
    var binaryToTernary   : String { return String(binaryToDecimalInt, radix: 3)  }
    
    var ternaryToDecimal: Int    { return Int(strtoul(self, nil, 3))      }
    var ternaryToDecimalString: String    { return String(strtoul(self, nil, 3))      }
    var ternaryToHexa  : String { return String(ternaryToDecimal, radix: 16)      }
    var ternaryToBinary: String { return String(ternaryToDecimal, radix: 2)      }
    var ternaryToOctal: String { return String(ternaryToDecimal, radix: 8)      }
    
    var OctalToDecimal: Int    { return Int(strtoul(self, nil, 8))      }
    var OctalToDecimalString: String    { return String(strtoul(self, nil, 8))      }
    var OctalToHexa  : String { return String(OctalToDecimal, radix: 16)      }
    var OctalToBinary: String { return String(OctalToDecimal, radix: 2)      }
    var OctalToTernary: String { return String(OctalToDecimal, radix: 3)      }
    
}

extension Int {
    var binaryString: String { return String(self, radix: 2)  }
    var hexaString  : String { return String(self, radix: 16) }
    var doubleValue : Double { return Double(self) }
}
