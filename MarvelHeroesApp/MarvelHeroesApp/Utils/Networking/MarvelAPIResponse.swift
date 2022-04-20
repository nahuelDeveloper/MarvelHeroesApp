//
//  MarvelAPIResponse.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 16/04/2022.
//

import Foundation

struct MarvelAPIResponse<T: Codable>: Codable {
  let code: Int
  let status: String
  let data: MarvelAPIResponseData<T>
}

struct MarvelAPIResponseData<T: Codable>: Codable {
  
  let offset: Int
  let limit: Int
  let total: Int
  let count: Int
  let results: [T]
}
