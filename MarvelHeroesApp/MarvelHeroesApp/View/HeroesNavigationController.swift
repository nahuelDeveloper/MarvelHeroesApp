//
//  HeroesNavigationController.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 09/04/2022.
//

import UIKit

class HeroesNavigationController: UINavigationController {
  
  init() {
    super.init(nibName: nil, bundle: nil)
    
    navigationBar.barStyle = .black
    navigationBar.isTranslucent = false
    navigationBar.backgroundColor = Theme.Colors.main
    
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.configureWithOpaqueBackground()
    navBarAppearance.backgroundColor = Theme.Colors.main
    UINavigationBar.appearance().standardAppearance = navBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    UINavigationBar.appearance().compactAppearance = navBarAppearance
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

