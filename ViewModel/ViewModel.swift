//
//  ViewModel.swift
//  Calculator
//
//  Created by Саша Руцман on 29.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ViewModel {
    
    var transfers = realm.objects(Transfer.self)
    
    func getData() {
        
        transfers = realm.objects(Transfer.self)
        
    }
    func tableViewViewModel(tableView: UITableView) -> TableViewViewModelType? {
        
        return TableViewViewModel(transfers: transfers)
        
    }
    
    func saveTransfer(originalSystemTextField: UITextField, resultSystemTextfield: UITextField) {
        
        if resultSystemTextfield.text != "" {
            let calendar = Calendar.current
            let time = calendar.dateComponents([.hour,.minute,.second], from: Date())
            let fullDate = "\(time.hour!):\(time.minute!):\(time.second!)"
            let transfer = Transfer(originalSystem: originalSystemTextField.text!, resultSystem: resultSystemTextfield.text!, date: fullDate)
            
            if transfers.count > 10 {
                StorageManager.deleteObject(transferObject: transfers.last!)
                StorageManager.saveObject(transferObject: transfer)
            } else {
                StorageManager.saveObject(transferObject: transfer)
            }
        }
        
    }
    
    var resultSystem: String?
    
    func calculateResult(originalSystemTextField: UITextField?, originalButton: UIButton?, resultButton: UIButton?, vc: UIViewController) -> Void {
        
        guard let originalSystemTextField = originalSystemTextField, let numberOriginal = originalSystemTextField.text, let originalButton = originalButton, let resultButton = resultButton else { return }
        
        if numberOriginal == "" {
            resultSystem = ""
            return
        }
        
        var message = ""
        let result = Systems(rawValue: (resultButton.titleLabel?.text)!)
        let original = Systems(rawValue: (originalButton.titleLabel?.text)!)
        
        switch original {
            case .Binary:
                for i in numberOriginal {
                    print(i)
                    if i != "0" && i != "1" {
                        message = "Двоичное число может содержать только цифры 0 и 1"
                        break
                    }
                }
                
                if message != "" {
                    break
                }
                
                switch result {
                    case .Binary:
                        resultSystem = numberOriginal
                    case .Ternary:
                        resultSystem = numberOriginal.binaryToTernary
                    case .Octal:
                        resultSystem = numberOriginal.binaryToOctal
                    case .Decimal:
                        resultSystem = numberOriginal.binaryToDecimalString
                    case .Hexadecimal:
                        resultSystem = numberOriginal.binaryToHexa
            }
            case .Ternary:
                
                for i in numberOriginal {
                    print(i)
                    if i != "0" && i != "1" && i != "2" {
                        message = "Троичное число может содержать только цифры 0, 1 и 2"
                        break
                    }
                }
                
                if message != "" {
                    break
                }
                
                switch result {
                    case .Binary:
                        resultSystem = numberOriginal.ternaryToBinary
                    case .Ternary:
                        resultSystem = numberOriginal
                    case .Octal:
                        resultSystem = numberOriginal.ternaryToOctal
                    case .Decimal:
                        resultSystem = numberOriginal.ternaryToDecimalString
                    case .Hexadecimal:
                        resultSystem = numberOriginal.ternaryToHexa
            }
            case .Octal:
                
                for i in numberOriginal {
                    print(i)
                    if i != "0" && i != "1" && i != "2" && i != "3" && i != "4" && i != "5"
                    && i != "6" && i != "7" {
                        message = "Восьмеричное число может содержать только цифры 0, 1, 2, 3, 4, 5, 6 и 7"
                        break
                    }
                }
                
                if message != "" {
                    break
                }
                
                switch result {
                case .Binary:
                    resultSystem = numberOriginal.OctalToBinary
                case .Ternary:
                    resultSystem = numberOriginal.OctalToTernary
                case .Octal:
                    resultSystem = numberOriginal
                case .Decimal:
                    resultSystem = numberOriginal.OctalToDecimalString
                case .Hexadecimal:
                    resultSystem = numberOriginal.OctalToHexa
            }
            case .Decimal:
                
                for i in numberOriginal {
                    print(i)
                    if i != "0" && i != "1" && i != "2" && i != "3" && i != "4" && i != "5"
                        && i != "6" && i != "7" && i != "8" && i != "9" {
                        message = "Десятичное число может содержать только цифры 0 - 9"
                        break
                    }
                }
                
                if message != "" {
                    break
                }
                
                switch result {
                    case .Binary:
                    resultSystem = numberOriginal.decimalToBinary
                    case .Ternary:
                    resultSystem = numberOriginal.decimalToTernary
                    case .Octal:
                    resultSystem = numberOriginal.decimalToOctal
                    case .Decimal:
                    resultSystem = numberOriginal
                    case .Hexadecimal:
                    resultSystem = numberOriginal.decimalToHexa
            }
            case .Hexadecimal:
                
                for i in numberOriginal {
                    print(i)
                    if i != "0" && i != "1" && i != "2" && i != "3" && i != "4" && i != "5"
                        && i != "6" && i != "7" && i != "8" && i != "9" && i != "a" && i != "b" && i != "c"
                        && i != "d" && i != "e" && i != "f" && i != "A" && i != "B" && i != "C"
                        && i != "D" && i != "E" && i != "F" {
                        message = "Шестнадцатиричное число может содержать только цифры 0 - 9 и буквы aA - fF"
                        break
                    }
                }
                
                if message != "" {
                    break
                }
                switch result {
                case .Binary:
                    resultSystem = numberOriginal.hexaToBinary
                case .Ternary:
                    resultSystem = numberOriginal.hexaToTernary
                case .Octal:
                    resultSystem = numberOriginal.hexaToOctal
                case .Decimal:
                    resultSystem = numberOriginal.hexaToString
                case .Hexadecimal:
                    resultSystem = numberOriginal
            }
        }
        
        if message != "" {
            showAlert(withMessage: message, vc: vc)
            message = ""
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
    
    func showAlert(withMessage message: String, vc: UIViewController) {
        
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        vc.present(alertController, animated: true, completion: nil)

    }
    
    
}

