//
//  Comic.swift
//  iMarvel
//
//  Created by Karim Sakr on 06/04/2024.
//

import Foundation

struct Comic: Codable {
    
    var id                 : Int           = 0
    var digitalId          : Int           = 0
    var title              : String        = ""
    var issueNumber        : Int           = 0
    var variantDescription : String        = ""
    var description        : String        = ""
    var modified           : String        = ""
    var isbn               : String        = ""
    var upc                : String        = ""
    var diamondCode        : String        = ""
    var ean                : String        = ""
    var issn               : String        = ""
    var format             : String        = ""
    var pageCount          : Int           = 0
    var resourceURI        : String        = ""
    var urls               : [Urls]        = []
    var series             : Archive        = Archive()
    var collections        : [String]      = []
    var collectedIssues    : [String]      = []
    var thumbnail          : Thumbnail     = Thumbnail()
    var stories            : Archive       = Archive()
    var events             : Archive        = Archive()
    
    enum CodingKeys: String, CodingKey {
        
        case id                 = "id"
        case digitalId          = "digitalId"
        case title              = "title"
        case issueNumber        = "issueNumber"
        case variantDescription = "variantDescription"
        case description        = "description"
        case modified           = "modified"
        case isbn               = "isbn"
        case upc                = "upc"
        case diamondCode        = "diamondCode"
        case ean                = "ean"
        case issn               = "issn"
        case format             = "format"
        case pageCount          = "pageCount"
        case resourceURI        = "resourceURI"
        case urls               = "urls"
        case series             = "series"
        case collections        = "collections"
        case collectedIssues    = "collectedIssues"
        case thumbnail          = "thumbnail"
        case stories            = "stories"
        case events             = "events"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id                 = try values.decodeIfPresent(Int.self           , forKey: .id                 ) ?? 0
        digitalId          = try values.decodeIfPresent(Int.self           , forKey: .digitalId          ) ?? 0
        title              = try values.decodeIfPresent(String.self        , forKey: .title              ) ?? ""
        issueNumber        = try values.decodeIfPresent(Int.self           , forKey: .issueNumber        ) ?? 0
        variantDescription = try values.decodeIfPresent(String.self        , forKey: .variantDescription ) ?? ""
        description        = try values.decodeIfPresent(String.self        , forKey: .description        ) ?? ""
        modified           = try values.decodeIfPresent(String.self        , forKey: .modified           ) ?? ""
        isbn               = try values.decodeIfPresent(String.self        , forKey: .isbn               ) ?? ""
        upc                = try values.decodeIfPresent(String.self        , forKey: .upc                ) ?? ""
        diamondCode        = try values.decodeIfPresent(String.self        , forKey: .diamondCode        ) ?? ""
        ean                = try values.decodeIfPresent(String.self        , forKey: .ean                ) ?? ""
        issn               = try values.decodeIfPresent(String.self        , forKey: .issn               ) ?? ""
        format             = try values.decodeIfPresent(String.self        , forKey: .format             ) ?? ""
        pageCount          = try values.decodeIfPresent(Int.self           , forKey: .pageCount          ) ?? 0
        resourceURI        = try values.decodeIfPresent(String.self        , forKey: .resourceURI        ) ?? ""
        urls               = try values.decodeIfPresent([Urls].self        , forKey: .urls               ) ?? []
        series             = try values.decodeIfPresent(Archive.self        , forKey: .series            ) ?? Archive()
        collections        = try values.decodeIfPresent([String].self      , forKey: .collections        ) ?? []
        collectedIssues    = try values.decodeIfPresent([String].self      , forKey: .collectedIssues    ) ?? []
        thumbnail          = try values.decodeIfPresent(Thumbnail.self     , forKey: .thumbnail          ) ?? Thumbnail()
        stories            = try values.decodeIfPresent(Archive.self       , forKey: .stories            ) ?? Archive()
        events             = try values.decodeIfPresent(Archive.self        , forKey: .events            ) ?? Archive()
        
    }
    
    init() {
        
    }
    
}
