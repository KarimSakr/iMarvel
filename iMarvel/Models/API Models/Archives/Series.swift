//
//  Series.swift
//  iMarvel
//
//  Created by Karim Sakr on 06/04/2024.
//

import Foundation

struct Series: Codable {
    
    var id          : Int?        = nil
    var title       : String?     = nil
    var description : String?     = nil
    var resourceURI : String?     = nil
    var urls        : [Urls]?     = []
    var startYear   : Int?        = nil
    var endYear     : Int?        = nil
    var rating      : String?     = nil
    var type        : String?     = nil
    var modified    : String?     = nil
    var thumbnail   : Thumbnail?  = Thumbnail()
    var stories     : Archive?    = Archive()
    var comics      : Archive?     = Archive()
    var events      : Archive?     = Archive()
    
    enum CodingKeys: String, CodingKey {
        
        case id          = "id"
        case title       = "title"
        case description = "description"
        case resourceURI = "resourceURI"
        case urls        = "urls"
        case startYear   = "startYear"
        case endYear     = "endYear"
        case rating      = "rating"
        case type        = "type"
        case modified    = "modified"
        case thumbnail   = "thumbnail"
        case stories     = "stories"
        case comics      = "comics"
        case events      = "events"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id          = try values.decodeIfPresent(Int.self        , forKey: .id          )
        title       = try values.decodeIfPresent(String.self     , forKey: .title       )
        description = try values.decodeIfPresent(String.self     , forKey: .description )
        resourceURI = try values.decodeIfPresent(String.self     , forKey: .resourceURI )
        urls        = try values.decodeIfPresent([Urls].self     , forKey: .urls        )
        startYear   = try values.decodeIfPresent(Int.self        , forKey: .startYear   )
        endYear     = try values.decodeIfPresent(Int.self        , forKey: .endYear     )
        rating      = try values.decodeIfPresent(String.self     , forKey: .rating      )
        type        = try values.decodeIfPresent(String.self     , forKey: .type        )
        modified    = try values.decodeIfPresent(String.self     , forKey: .modified    )
        thumbnail   = try values.decodeIfPresent(Thumbnail.self  , forKey: .thumbnail   )
        stories     = try values.decodeIfPresent(Archive.self    , forKey: .stories     )
        comics      = try values.decodeIfPresent(Archive.self     , forKey: .comics      )
        events      = try values.decodeIfPresent(Archive.self     , forKey: .events      )
        
    }
    
    init() {
        
    }
    
}
