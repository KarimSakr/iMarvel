//
//  Archive.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation

struct Archive: Codable {

  var available     : Int     = 0
  var collectionURI : String  = ""
  var items         : [Items] = []
  var returned      : Int     = 0

  enum CodingKeys: String, CodingKey {

    case available     = "available"
    case collectionURI = "collectionURI"
    case items         = "items"
    case returned      = "returned"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    available     = try values.decodeIfPresent(Int.self     , forKey: .available     ) ?? 0
    collectionURI = try values.decodeIfPresent(String.self  , forKey: .collectionURI ) ?? ""
    items         = try values.decodeIfPresent([Items].self , forKey: .items         ) ?? []
    returned      = try values.decodeIfPresent(Int.self     , forKey: .returned      ) ?? 0
 
  }

  init() {

  }

}
