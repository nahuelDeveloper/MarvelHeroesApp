//
//  BaseViewController.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 08/04/2022.
//

import UIKit
import JGProgressHUD

// Base class for all View Controllers.
class BaseViewController: UIViewController {
  
  lazy var loader: JGProgressHUD = {
    let v = JGProgressHUD(style: .dark)
    return v
  }()
  
  weak var coordinator: MainCoordinator?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = Theme.Colors.secondary
  }
  
  func showLoader() {
    loader.show(in: view)
  }
  
  func hideLoader() {
    loader.dismiss(animated: true)
  }
  
  func showError(errorMessage: String) {
    let alert = UIAlertController(
      title: "Error",
      message: errorMessage,
      preferredStyle: .alert)
    let acceptAction = UIAlertAction(
      title: "Ok",
      style: .cancel)
    alert.addAction(acceptAction)
    navigationController?.present(alert, animated: true)
  }
}
