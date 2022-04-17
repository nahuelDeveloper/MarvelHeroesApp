//
//  MarvelHeroesAppTests.swift
//  MarvelHeroesAppTests
//
//  Created by Nahuel on 31/03/2022.
//

import XCTest
@testable import MarvelHeroesApp

class MarvelHeroesAppTests: XCTestCase {
  
  func test_parseCharacters() {
    let characters = testBundle.decode([Hero].self, from: "characters.json")
    XCTAssertEqual(characters.count, 20)
  }
  
  func test_parseAPIResponse() {
    let heroes = testBundle.decode(MarvelAPIResponse<Hero>.self, from: "marvel-api-response.json")
    XCTAssertEqual(heroes.data.results.count, 1)
  }
}

extension XCTestCase {
  
  var testBundle: Bundle {
    return Bundle(for: type(of: self))
  }
}
