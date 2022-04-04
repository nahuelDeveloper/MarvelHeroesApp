//
//  HeroesPresenter.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 31/03/2022.
//

import UIKit
import Foundation

class HeroesPresenter {
  
  var heroes: [Hero]
  
  init(heroes: [Hero]) {
    self.heroes = heroes
  }
  
  func getHeroesCount() -> Int {
    return heroes.count
  }
  
  func getHero(atIndex index: Int) -> Hero {
    return heroes[index]
  }
}
