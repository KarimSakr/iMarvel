//
//  Character.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation

struct Character: Decodable {
    
    var id          : Int       = 0
    var name        : String    = ""
    var description : String    = ""
    var modified    : String    = ""
    var thumbnail   : Thumbnail = Thumbnail()
    var resourceURI : String    = ""
    var urls        : [Urls]    = []
    var comics      : Archive   = Archive()
    var series      : Archive   = Archive()
    var stories     : Archive   = Archive()
    var events      : Archive   = Archive()
    
    enum CodingKeys: String, CodingKey {
        
        case id          = "id"
        case name        = "name"
        case description = "description"
        case modified    = "modified"
        case thumbnail   = "thumbnail"
        case resourceURI = "resourceURI"
        case comics      = "comics"
        case series      = "series"
        case stories     = "stories"
        case events      = "events"
        case urls        = "urls"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id          = try values.decodeIfPresent(Int.self       , forKey: .id          ) ?? 0
        name        = try values.decodeIfPresent(String.self    , forKey: .name        ) ?? ""
        description = try values.decodeIfPresent(String.self    , forKey: .description ) ?? ""
        modified    = try values.decodeIfPresent(String.self    , forKey: .modified    ) ?? ""
        thumbnail   = try values.decodeIfPresent(Thumbnail.self , forKey: .thumbnail   ) ?? Thumbnail()
        resourceURI = try values.decodeIfPresent(String.self    , forKey: .resourceURI ) ?? ""
        urls        = try values.decodeIfPresent([Urls].self    , forKey: .urls        ) ?? []
        comics      = try values.decodeIfPresent(Archive.self    , forKey: .comics     ) ?? Archive()
        series      = try values.decodeIfPresent(Archive.self    , forKey: .series     ) ?? Archive()
        stories     = try values.decodeIfPresent(Archive.self   , forKey: .stories     ) ?? Archive()
        events      = try values.decodeIfPresent(Archive.self    , forKey: .events     ) ?? Archive()
        
    }
    
    init() {
        
    }
    
    private static let db = LocalDatabaseManager.shared
    func cache() {
        
        guard let character = Character.db.add(CharacterCD.self) else { return }
        character.id = id
        character.name = name
        character.thumbnailURL = thumbnail.path + "." + thumbnail.ext
        
        Character.db.save()
    }
    
}
