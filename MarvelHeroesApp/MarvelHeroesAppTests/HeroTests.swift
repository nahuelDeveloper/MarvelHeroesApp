//
//  HeroTests.swift
//  MarvelHeroesAppTests
//
//  Created by Nahuel on 08/04/2022.
//

import Foundation
import XCTest

class HeroTests: XCTestCase {
  
  var sut: Hero!
  
  override func setUp() {
    sut = Bundle.main.decode(Hero.self, from: "marvel-character.json")
  }
  
  override func tearDown() {
    sut = nil
  }
  
  func test_getHeroThumbnailUrl() {
    XCTAssertEqual(sut.getHeroThumbnailUrl(), "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg")
  }
}
