//
//  NetworkManager.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 11/04/2022.
//

import Foundation
import Moya

enum MarvelAPIError: Error {
  case apiError
  case apiFailure
}

class NetworkManager {
  
  typealias HeroesResult = (Result<[Hero], Error>)->()
  
  static let shared = NetworkManager()
  
  var plugin: PluginType
  var provider: MoyaProvider<MarvelAPI>
  var decoder: JSONDecoder
  
  private init() {
    plugin = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
    provider = MoyaProvider<MarvelAPI>(plugins: [plugin])
    decoder = JSONDecoder()
  }
  
  func getHeroes(result: @escaping HeroesResult) {
    provider.request(.getCharacters) { [unowned self] moyaResult in
      switch moyaResult {
      case let .success(response):
        do {
          let marvelAPIResponse = try self.decoder.decode(MarvelAPIResponse<Hero>.self, from: response.data)
          let heroes = marvelAPIResponse.data.results
          result(.success(heroes))
        }
        catch {
          print("Moya error: \(error)")
          result(.failure(MarvelAPIError.apiError))
        }
        break
      case let .failure(error):
        print("Moya failure error: \(error.errorDescription ?? "api failure")")
        result(.failure(MarvelAPIError.apiFailure))
        break
      }
    }
  }
}
