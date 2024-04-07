//
//  Story.swift
//  iMarvel
//
//  Created by Karim Sakr on 07/04/2024.
//

import Foundation

struct Story: Codable {
    
    var id            : Int           = 0
    var title         : String        = ""
    var thumbnail     : String        = ""
    
    enum CodingKeys: String, CodingKey {
        
        case id            = "id"
        case title         = "title"
        case thumbnail     = "thumbnail"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id            = try values.decodeIfPresent(Int.self           , forKey: .id            ) ?? 0
        title         = try values.decodeIfPresent(String.self        , forKey: .title         ) ?? ""
        thumbnail     = try values.decodeIfPresent(String.self        , forKey: .thumbnail     ) ?? ""
    }
    
    init() {
        
    }
    
}
