//
//  Bundle.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation

extension Bundle {
    func value(ofKey key: String) -> String {
        guard let configFile = Bundle.main.path(forResource: "Config", ofType: "plist") else { return "" }
        let dict = NSDictionary(contentsOfFile: configFile) as! [String: String]
        return dict[key] ?? ""
    }
}
