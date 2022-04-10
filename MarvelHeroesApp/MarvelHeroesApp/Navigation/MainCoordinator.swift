//
//  MainCoordinator.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 08/04/2022.
//

import UIKit

class MainCoordinator: Coordinator {
  
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
      self.navigationController = navigationController
  }

  func start() {
    let heroesPresenter = HeroesPresenter(heroes: Bundle.main.decode([Hero].self, from: "marvel-characters.json"))
    let heroesViewController = HeroesViewController(presenter: heroesPresenter)
    heroesViewController.coordinator = self
    navigationController.pushViewController(heroesViewController, animated: false)
  }
  
  func showHeroDetailScreen(_ hero: Hero) {
    let heroDetailPresenter = HeroDetailPresenter(hero: hero)
    let heroDetailVC = HeroDetailViewController(presenter: heroDetailPresenter)
    heroDetailVC.coordinator = self
    navigationController.pushViewController(heroDetailVC, animated: true)
  }
}
