//
//  ExtensionString.swift
//  Calculator
//
//  Created by Саша Руцман on 30.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import Foundation

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
