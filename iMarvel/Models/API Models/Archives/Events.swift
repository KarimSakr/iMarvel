//
//  Events.swift
//  iMarvel
//
//  Created by Karim Sakr on 06/04/2024.
//

import Foundation

struct Events: Codable {
    
    var id          : Int?        = nil
    var title       : String?     = nil
    var description : String?     = nil
    var resourceURI : String?     = nil
    var urls        : [Urls]?     = []
    var modified    : String?     = nil
    var start       : String?     = nil
    var end         : String?     = nil
    var thumbnail   : Thumbnail?  = Thumbnail()
    var stories     : Archive?    = Archive()
    var comics      : Archive?     = Archive()
    var series      : Archive?     = Archive()
    
    enum CodingKeys: String, CodingKey {
        
        case id          = "id"
        case title       = "title"
        case description = "description"
        case resourceURI = "resourceURI"
        case urls        = "urls"
        case modified    = "modified"
        case start       = "start"
        case end         = "end"
        case thumbnail   = "thumbnail"
        case stories     = "stories"
        case comics      = "comics"
        case series      = "series"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id          = try values.decodeIfPresent(Int.self        , forKey: .id          )
        title       = try values.decodeIfPresent(String.self     , forKey: .title       )
        description = try values.decodeIfPresent(String.self     , forKey: .description )
        resourceURI = try values.decodeIfPresent(String.self     , forKey: .resourceURI )
        urls        = try values.decodeIfPresent([Urls].self     , forKey: .urls        )
        modified    = try values.decodeIfPresent(String.self     , forKey: .modified    )
        start       = try values.decodeIfPresent(String.self     , forKey: .start       )
        end         = try values.decodeIfPresent(String.self     , forKey: .end         )
        thumbnail   = try values.decodeIfPresent(Thumbnail.self  , forKey: .thumbnail   )
        stories     = try values.decodeIfPresent(Archive.self    , forKey: .stories     )
        comics      = try values.decodeIfPresent(Archive.self     , forKey: .comics      )
        series      = try values.decodeIfPresent(Archive.self     , forKey: .series      )
    }
    
    init() {
        
    }
    
}
