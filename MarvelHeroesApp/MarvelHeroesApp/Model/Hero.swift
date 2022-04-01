//
//  Hero.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 31/03/2022.
//

import Foundation

struct Hero: Codable {
  
  var id: Int
  var name: String
  var description: String
  var thumbnail: Thumbnail
  
}

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
