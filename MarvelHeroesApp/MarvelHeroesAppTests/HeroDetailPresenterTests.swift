//
//  HeroDetailPresenterTests.swift
//  MarvelHeroesAppTests
//
//  Created by Nahuel on 08/04/2022.
//

import XCTest

class HeroDetailPresenterTests: XCTestCase {
  
  var sut: HeroDetailPresenter!
  
  override func setUp() {
    sut = HeroDetailPresenter(hero: testBundle.decode(Hero.self, from: "marvel-character.json"))
  }
  
  override func tearDown() {
    sut = nil
  }
  
  func test_getHeroName() {
    XCTAssertEqual(sut.getHeroName(), "A-Bomb (HAS)")
  }
  
  func test_getHeroDescription() {
    XCTAssertEqual(sut.getHeroDescription(), "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ")
  }
}
