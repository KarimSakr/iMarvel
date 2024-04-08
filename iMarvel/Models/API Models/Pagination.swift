//
//  Pagination.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation

struct Pagination<T:Decodable>: Decodable {

  var offset  : Int       = 0
  var limit   : Int       = 0
  var total   : Int       = 0
  var count   : Int       = 0
  var results : T? = nil

  enum CodingKeys: String, CodingKey {

    case offset  = "offset"
    case limit   = "limit"
    case total   = "total"
    case count   = "count"
    case results = "results"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    offset  = try values.decodeIfPresent(Int.self, forKey: .offset  ) ?? 0
    limit   = try values.decodeIfPresent(Int.self, forKey: .limit   ) ?? 0
    total   = try values.decodeIfPresent(Int.self, forKey: .total   ) ?? 0
    count   = try values.decodeIfPresent(Int.self, forKey: .count   ) ?? 0
    results = try values.decodeIfPresent(T.self  , forKey: .results )
 
  }

  init() {

  }

}
