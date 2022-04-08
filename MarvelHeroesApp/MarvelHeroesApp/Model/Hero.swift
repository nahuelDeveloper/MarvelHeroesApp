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
  
  func getHeroThumbnailUrl() -> String {
    return "\(thumbnail.path).\(thumbnail.thumbnailExtension)"
  }
}
