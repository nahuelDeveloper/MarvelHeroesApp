//
//  BaseViewController.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 08/04/2022.
//

import UIKit

// Base class for all View Controllers.
class BaseViewController: UIViewController {
  
  weak var coordinator: MainCoordinator?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = Theme.Colors.secondary
  }
}
