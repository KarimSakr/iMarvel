//
//  Event.swift
//  iMarvel
//
//  Created by Karim Sakr on 06/04/2024.
//

import Foundation

struct Event: Codable {
    
    var id          : Int       = 0
    var title       : String    = ""
    var thumbnail   : Thumbnail = Thumbnail()
    
    enum CodingKeys: String, CodingKey {
        
        case id          = "id"
        case title       = "title"
        case thumbnail   = "thumbnail"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id          = try values.decodeIfPresent(Int.self        , forKey: .id          ) ?? 0
        title       = try values.decodeIfPresent(String.self     , forKey: .title       ) ?? ""
        thumbnail   = try values.decodeIfPresent(Thumbnail.self  , forKey: .thumbnail   ) ?? Thumbnail()
    }
    
    init() {
        
    }
    
}
