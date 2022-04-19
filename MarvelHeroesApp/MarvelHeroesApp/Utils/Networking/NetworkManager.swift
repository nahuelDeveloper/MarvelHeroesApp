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
  case reachedFinalPage
}

final class NetworkManager {
  
  struct HeroesPaginator {
    var offset: Int
    let limit: Int
    var reachedFinalPage: Bool
    
    mutating func moveToNextPage(currentPageCount: Int) {
      if currentPageCount == limit {
        offset += limit
        print("Move to page: \(offset/limit)")
      } else {
        print("Move to final page")
        reachedFinalPage = true
      }
    }
  }
  
  static let shared = NetworkManager()
  
  var plugin: PluginType
  var provider: MoyaProvider<MarvelAPI>
  var decoder: JSONDecoder
  var heroesPaginator: HeroesPaginator
  
  private init() {
    plugin = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
    provider = MoyaProvider<MarvelAPI>(plugins: [plugin])
    decoder = JSONDecoder()
    heroesPaginator = HeroesPaginator(offset: 0, limit: 30, reachedFinalPage: false)
  }
}

extension NetworkManager {
  
  typealias HeroesResult = (Result<[Hero], Error>)->()
  
  func getHeroes(result: @escaping HeroesResult) {
    if heroesPaginator.reachedFinalPage {
      print("Reached final page")
      result(.failure(MarvelAPIError.reachedFinalPage))
      return
    }
    
    let currentOffset = heroesPaginator.offset
    let limit = heroesPaginator.limit
    
    provider.request(.getCharacters(offset: currentOffset, limit: limit)) { [unowned self] moyaResult in
      switch moyaResult {
      case let .success(response):
        do {
          let marvelAPIResponse = try self.decoder.decode(MarvelAPIResponse<Hero>.self, from: response.data)
          let heroes = marvelAPIResponse.data.results
          heroesPaginator.moveToNextPage(currentPageCount: heroes.count)
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
