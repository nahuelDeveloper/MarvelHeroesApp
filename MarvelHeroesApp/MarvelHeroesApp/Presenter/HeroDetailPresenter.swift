//
//  HeroDetailPresenter.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 08/04/2022.
//

import Foundation

class HeroDetailPresenter {
  
  var hero: Hero
  
  init(hero: Hero) {
    self.hero = hero
  }
  
  func getHeroName() -> String {
    return hero.name
  }
  
  func getHeroDescription() -> String {
    return hero.description
  }
}
