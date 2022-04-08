//
//  SceneDelegate.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 31/03/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  
  var coordinator: MainCoordinator?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let navigationController = UINavigationController()
    navigationController.navigationBar.barStyle = .black
    
    coordinator = MainCoordinator(navigationController: navigationController)
    coordinator?.start()
    
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }

}

