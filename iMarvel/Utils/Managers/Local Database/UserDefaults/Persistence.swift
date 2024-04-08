//
//  Persistence.swift
//  iMarvel
//
//  Created by Karim Sakr on 08/04/2024.
//

import Foundation

class Persistence {
    
    static let shared = Persistence()
    
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    //MARK: - Save Data
    func save(key: String, object: Any) {
        defaults.set(object, forKey: key)
    }
    
    //MARK: - Fetch Data
    func getData(key: String) -> Any? {
        return defaults.object(forKey: key)
    }
    
}
