//
//  Systems.swift
//  Calculator
//
//  Created by Саша Руцман on 29.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import Foundation

enum Systems: String {
    
    case Binary = "Двоичная"
    case Ternary = "Троичная"
    case Octal = "Восьмеричная"
    case Decimal = "Десятичная"
    case Hexadecimal = "Шестнадцатиричная"

    init(rawValue: String) {
        switch rawValue {
        case "Двоичная": self = .Binary
        case "Троичная": self = .Ternary
        case "Восьмеричная": self = .Octal
        case "Десятичная": self = .Decimal
        case "Шестнадцатиричная": self = .Hexadecimal
        default: self = .Binary
            
        }
    }
}
