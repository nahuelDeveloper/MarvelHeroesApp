//
//  HeroesPresenter.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 31/03/2022.
//

import Foundation

protocol HeroesPresenterDelegate: AnyObject {
  func showLoader(_ presenter: HeroesPresenter)
  func hideLoader(_ presenter: HeroesPresenter)
  func loadedHeroes(_ presenter: HeroesPresenter, heroes: [Hero])
  func showError(_ presenter: HeroesPresenter, errorMessage: String)
  func showEmptyHeroesView(_ presenter: HeroesPresenter)
  func hideEmptyHeroesView(_ presenter: HeroesPresenter)
}

class HeroesPresenter {
  
  var heroes: [Hero] = []
    
  weak var delegate: HeroesPresenterDelegate?
  
  var shouldDisplayEmptyHeroesView: Bool {
    didSet {
      if shouldDisplayEmptyHeroesView {
        delegate?.showEmptyHeroesView(self)
      } else {
        delegate?.hideEmptyHeroesView(self)
      }
    }
  }
  
  init() {
    shouldDisplayEmptyHeroesView = false
  }
  
  init(heroes: [Hero]) {
    self.heroes = heroes
    shouldDisplayEmptyHeroesView = false
  }
  
  func fetchHeroes() {
    delegate?.showLoader(self)

    NetworkManager.shared.getHeroes { [weak self] result in
      guard let strongSelf = self else { return }
      strongSelf.delegate?.hideLoader(strongSelf)

      switch result {
      case .success(let heroes):
        strongSelf.heroes += heroes
        strongSelf.delegate?.loadedHeroes(strongSelf, heroes: heroes)
        strongSelf.shouldDisplayEmptyHeroesView = false
        break
      case .failure(let error):
        strongSelf.delegate?.showError(strongSelf, errorMessage: error.errorMessage)
        strongSelf.shouldDisplayEmptyHeroesView = strongSelf.heroes.count == 0
        break
      }
    }
  }
    
  func getHeroesCount() -> Int {
    return heroes.count
  }
  
  func getHero(atIndex index: Int) -> Hero {
    return heroes[index]
  }
}
