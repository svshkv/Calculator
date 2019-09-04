//
//  StorageManager.swift
//  Calculator
//
//  Created by Саша Руцман on 02.09.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(transferObject: Transfer) {
        try! realm.write {
            realm.add(transferObject)
        }
    }
    
    static func deleteObject(transferObject: Transfer) {
        try! realm.write {
            realm.delete(transferObject)
        }
    }
    
    static func deleteAllObjects() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
}
