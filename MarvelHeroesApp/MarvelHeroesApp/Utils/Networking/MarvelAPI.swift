//
//  MarvelAPI.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 16/04/2022.
//

import Foundation
import Moya
import CryptoKit

// MARK: - Constants.

// Marvel API keys.
private let privateKey = "24ce686ef0e0de2df09455e88375c3ec8c5eaf94"
private let publicKey = "e5f3e217bf53964d1105d51770ee9cb0"

// Marvel API base URL and endpoints.
private let kBaseURL: String = "https://gateway.marvel.com/"
private let getCharactersEndpoint = "v1/public/characters"

// Other
private let kAuthParamsDictApiKey = "apikey"
private let kAuthParamsDictHash = "hash"
private let kAuthParamsDictTimestamp = "ts"
private let kParamsDictOffset = "offset"
private let kParamsDictLimit = "limit"

private let kHeadersContentTypeKey = "Content-type"
private let kHeadersContentTypeValue = "application/json"

private let kDateFormat = "YYYY-MM-DD"
private let kMd5format = "%02hhx"

// MARK: - Moya setup.

enum MarvelAPI {
  case getCharacters(offset: Int, limit: Int)
  
  private var apiKey: String {
    return publicKey
  }
  
  private var timestamp: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = kDateFormat
    return dateFormatter.string(from: Date())
  }
  
  private var hash: String {
    return "\(timestamp)\(privateKey)\(publicKey)".md5()
  }
  
  /// All the endpoints from the Marvel API require 3 parameters: an api key, a hash and a timestamp.
  private var authParams: Dictionary<String, String> {
    return [
      kAuthParamsDictApiKey: apiKey,
      kAuthParamsDictHash: hash,
      kAuthParamsDictTimestamp: timestamp
    ]
  }
}

extension MarvelAPI: TargetType {
  
  var baseURL: URL {
    return URL(string: kBaseURL)!
  }
  
  var path: String {
    switch self {
    case .getCharacters:
      return getCharactersEndpoint
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
    case .getCharacters(let offset, let limit):
      var params = [
        kParamsDictOffset: String(offset),
        kParamsDictLimit: String(limit)
      ]
      params.merge(with: authParams)
      return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
    }
  }
  
  var headers: [String : String]? {
    return [kHeadersContentTypeKey: kHeadersContentTypeValue]
  }
}

extension String {
  func md5() -> String {
    return Insecure.MD5.hash(data: self.data(using: .utf8)!).map { String(format: kMd5format, $0) }.joined()
  }
}

extension Dictionary {
  mutating func merge(with dictionary: Dictionary) {
    dictionary.forEach { updateValue($1, forKey: $0) }
  }
}
