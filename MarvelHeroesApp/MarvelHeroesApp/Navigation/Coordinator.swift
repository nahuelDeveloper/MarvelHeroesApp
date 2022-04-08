//
//  Coordinator.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 08/04/2022.
//

import UIKit

// Handles navigation between different screens.
protocol Coordinator {
  
  var navigationController: UINavigationController { get set }

  func start()
  
  func showHeroDetailScreen()
}
