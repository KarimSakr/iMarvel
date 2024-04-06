//
//  Comic.swift
//  iMarvel
//
//  Created by Karim Sakr on 06/04/2024.
//

import Foundation

struct Comic: Codable {
    
    var id                 : Int?           = nil
    var digitalId          : Int?           = nil
    var title              : String?        = nil
    var issueNumber        : Int?           = nil
    var variantDescription : String?        = nil
    var description        : String?        = nil
    var modified           : String?        = nil
    var isbn               : String?        = nil
    var upc                : String?        = nil
    var diamondCode        : String?        = nil
    var ean                : String?        = nil
    var issn               : String?        = nil
    var format             : String?        = nil
    var pageCount          : Int?           = nil
    var resourceURI        : String?        = nil
    var urls               : [Urls]?        = []
    var series             : Archive?        = Archive()
    var collections        : [String]?      = []
    var collectedIssues    : [String]?      = []
    var thumbnail          : Thumbnail?     = Thumbnail()
    var stories            : Archive?       = Archive()
    var events             : Archive?        = Archive()
    
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
        
        id                 = try values.decodeIfPresent(Int.self           , forKey: .id                 )
        digitalId          = try values.decodeIfPresent(Int.self           , forKey: .digitalId          )
        title              = try values.decodeIfPresent(String.self        , forKey: .title              )
        issueNumber        = try values.decodeIfPresent(Int.self           , forKey: .issueNumber        )
        variantDescription = try values.decodeIfPresent(String.self        , forKey: .variantDescription )
        description        = try values.decodeIfPresent(String.self        , forKey: .description        )
        modified           = try values.decodeIfPresent(String.self        , forKey: .modified           )
        isbn               = try values.decodeIfPresent(String.self        , forKey: .isbn               )
        upc                = try values.decodeIfPresent(String.self        , forKey: .upc                )
        diamondCode        = try values.decodeIfPresent(String.self        , forKey: .diamondCode        )
        ean                = try values.decodeIfPresent(String.self        , forKey: .ean                )
        issn               = try values.decodeIfPresent(String.self        , forKey: .issn               )
        format             = try values.decodeIfPresent(String.self        , forKey: .format             )
        pageCount          = try values.decodeIfPresent(Int.self           , forKey: .pageCount          )
        resourceURI        = try values.decodeIfPresent(String.self        , forKey: .resourceURI        )
        urls               = try values.decodeIfPresent([Urls].self        , forKey: .urls               )
        series             = try values.decodeIfPresent(Archive.self        , forKey: .series             )
        collections        = try values.decodeIfPresent([String].self      , forKey: .collections        )
        collectedIssues    = try values.decodeIfPresent([String].self      , forKey: .collectedIssues    )
        thumbnail          = try values.decodeIfPresent(Thumbnail.self     , forKey: .thumbnail          )
        stories            = try values.decodeIfPresent(Archive.self       , forKey: .stories            )
        events             = try values.decodeIfPresent(Archive.self        , forKey: .events             )
        
    }
    
    init() {
        
    }
    
}
