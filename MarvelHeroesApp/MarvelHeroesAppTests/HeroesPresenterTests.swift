//
//  HeroesPresenterTests.swift
//  MarvelHeroesAppTests
//
//  Created by Nahuel on 03/04/2022.
//

import XCTest

class HeroesPresenterTests: XCTestCase {
  
  var sut: HeroesPresenter!
  
  override func setUp() {
    sut = HeroesPresenter(heroes: testBundle.decode([Hero].self, from: "characters.json"))
  }
  
  override func tearDown() {
    sut = nil
  }
  
  func test_getHeroesCount() {
    XCTAssertEqual(sut.getHeroesCount(), 20)
  }
  
  func test_getHeroAtIndex() {
    XCTAssertEqual(sut.getHero(atIndex: 3).name, "Aaron Stack")
  }
}
