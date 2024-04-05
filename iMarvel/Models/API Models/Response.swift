//
//  Response.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation

struct Response<T:Decodable>: Decodable {
    
    var code            : Int        = 404
    var status          : String     = ""
    var copyright       : String     = ""
    var attributionText : String     = ""
    var attributionHTML : String     = ""
    var etag            : String     = ""
    var data            : Pagination = Pagination<T>()
    
    enum CodingKeys: String, CodingKey {
        
        case code            = "code"
        case status          = "status"
        case copyright       = "copyright"
        case attributionText = "attributionText"
        case attributionHTML = "attributionHTML"
        case etag            = "etag"
        case data            = "data"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        code            = try values.decodeIfPresent(Int.self       , forKey: .code            ) ?? 404
        status          = try values.decodeIfPresent(String.self    , forKey: .status          ) ?? ""
        copyright       = try values.decodeIfPresent(String.self    , forKey: .copyright       ) ?? ""
        attributionText = try values.decodeIfPresent(String.self    , forKey: .attributionText ) ?? ""
        attributionHTML = try values.decodeIfPresent(String.self    , forKey: .attributionHTML ) ?? ""
        etag            = try values.decodeIfPresent(String.self    , forKey: .etag            ) ?? ""
        data            = try values.decodeIfPresent(Pagination.self, forKey: .data            ) ?? Pagination()
        
    }
    
    init() {
        
    }
    
}
