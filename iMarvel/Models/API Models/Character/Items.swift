//
//  Items.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation

struct Items: Codable {
    
    var resourceURI : String = ""
    var name        : String = ""
    
    enum CodingKeys: String, CodingKey {
        
        case resourceURI = "resourceURI"
        case name        = "name"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        resourceURI = try values.decodeIfPresent(String.self , forKey: .resourceURI ) ?? ""
        name        = try values.decodeIfPresent(String.self , forKey: .name        ) ?? ""
        
    }
    
    init() {
        
    }
    
}
