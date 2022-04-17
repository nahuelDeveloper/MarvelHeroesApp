//
//  Hero.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 31/03/2022.
//

import Foundation

struct Hero: Codable {
  
  let id: Int
  let name: String
  let description: String
  let thumbnail: Thumbnail
  
  func getHeroThumbnailUrl() -> String {
    return "\(thumbnail.path).\(thumbnail.thumbnailExtension)"
  }
}
