//
//  Thumbnail.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation

struct Thumbnail: Codable {
    
    var path: String = ""
    var ext : String = ""
    
    enum CodingKeys: String, CodingKey {
        
        case path      = "path"
        case ext = "extension"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        path = try values.decodeIfPresent(String.self , forKey: .path) ?? ""
        ext  = try values.decodeIfPresent(String.self , forKey: .ext ) ?? ""
        
    }
    
    init() {
        
    }
    
}
