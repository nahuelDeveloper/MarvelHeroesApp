//
//  SceneDelegate.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 31/03/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let heroesPresenter = HeroesPresenter(heroes: Bundle.main.decode([Hero].self, from: "marvel-characters.json"))
    let heroesViewController = HeroesViewController(presenter: heroesPresenter)
    let navigationController = UINavigationController(rootViewController: heroesViewController)
    navigationController.navigationBar.barStyle = .black
    
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }

}

