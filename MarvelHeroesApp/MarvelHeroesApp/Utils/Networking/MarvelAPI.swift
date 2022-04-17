//
//  MarvelAPI.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 16/04/2022.
//

import Foundation
import Moya
import CryptoKit

let privateKey = "24ce686ef0e0de2df09455e88375c3ec8c5eaf94"
let publicKey = "e5f3e217bf53964d1105d51770ee9cb0"

enum MarvelAPI {
  case getCharacters
  
  private var apiKey: String {
    return publicKey
  }
  
  private var timestamp: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-DD"
    return dateFormatter.string(from: Date())
  }
  
  private var hash: String {
    return "\(timestamp)\(privateKey)\(publicKey)".md5()
  }
  
  private var authParams: Dictionary<String, String> {
    return [
      "apikey": apiKey,
      "hash": hash,
      "ts": timestamp
    ]
  }
}

extension MarvelAPI: TargetType {
  
  var baseURL: URL {
    return URL(string: "https://gateway.marvel.com/")!
  }
  
  var path: String {
    switch self {
    case .getCharacters:
      return "v1/public/characters"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getCharacters:
      return .get
    }
  }
  
  var task: Task {
    switch self {
    case .getCharacters:
      return .requestParameters(parameters: authParams, encoding: URLEncoding.queryString)
    }
  }
  
  var headers: [String : String]? {
    return ["Content-type": "application/json"]
  }
}

extension String {
    func md5() -> String {
        return Insecure.MD5.hash(data: self.data(using: .utf8)!).map { String(format: "%02hhx", $0) }.joined()
    }
}
