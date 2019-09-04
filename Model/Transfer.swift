//
//  Transfer.swift
//  Calculator
//
//  Created by Саша Руцман on 28.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import RealmSwift

class Transfer: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var originalSystem: String = ""
    @objc dynamic var resultSystem: String = ""
    @objc dynamic var date: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: Int, originalSystem: String, resultSystem: String, date: String) {
        self.init()
        self.id = id
        self.originalSystem = originalSystem
        self.resultSystem = resultSystem
        self.date = date
    }
}
