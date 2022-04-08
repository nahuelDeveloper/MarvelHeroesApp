//
//  Thumbnail.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 08/04/2022.
//

import Foundation

struct Thumbnail: Codable {
  
  var path: String
  var thumbnailExtension: String
  
  enum CodingKeys: String, CodingKey {
    case path
    case thumbnailExtension = "extension"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    path = try container.decode(String.self, forKey: CodingKeys.path)
    thumbnailExtension = try container.decode(String.self, forKey: CodingKeys.thumbnailExtension)
  }
}
