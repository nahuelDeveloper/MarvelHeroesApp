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

}

extension XCTestCase {
  
  var testBundle: Bundle {
    return Bundle(for: type(of: self))
  }
}
