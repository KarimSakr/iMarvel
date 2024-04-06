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
    var description   : String        = ""
    var resourceURI   : String        = ""
    var type          : String        = ""
    var modified      : String        = ""
    var thumbnail     : String        = ""
    var series        : Archive       = Archive()
    var comics        : Archive       = Archive()
    var events        : Archive       = Archive()
    
    enum CodingKeys: String, CodingKey {
        
        case id            = "id"
        case title         = "title"
        case description   = "description"
        case resourceURI   = "resourceURI"
        case type          = "type"
        case modified      = "modified"
        case thumbnail     = "thumbnail"
        case series        = "series"
        case comics        = "comics"
        case events        = "events"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id            = try values.decodeIfPresent(Int.self           , forKey: .id            ) ?? 0
        title         = try values.decodeIfPresent(String.self        , forKey: .title         ) ?? ""
        description   = try values.decodeIfPresent(String.self        , forKey: .description   ) ?? ""
        resourceURI   = try values.decodeIfPresent(String.self        , forKey: .resourceURI   ) ?? ""
        type          = try values.decodeIfPresent(String.self        , forKey: .type          ) ?? ""
        modified      = try values.decodeIfPresent(String.self        , forKey: .modified      ) ?? ""
        thumbnail     = try values.decodeIfPresent(String.self        , forKey: .thumbnail     ) ?? ""
        series        = try values.decodeIfPresent(Archive.self        , forKey: .series       ) ?? Archive()
        comics        = try values.decodeIfPresent(Archive.self        , forKey: .comics       ) ?? Archive()
        events        = try values.decodeIfPresent(Archive.self        , forKey: .events       ) ?? Archive()
    }
    
    init() {
        
    }
    
}
