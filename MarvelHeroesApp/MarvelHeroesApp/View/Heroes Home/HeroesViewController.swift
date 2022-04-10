//
//  HeroesViewController.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 31/03/2022.
//

import UIKit
import PureLayout

class HeroesViewController: BaseViewController {
  
  private var presenter: HeroesPresenter
  
  // MARK: - UI props.
  
  private lazy var tableView: UITableView = {
    let v = UITableView()
    v.rowHeight = UITableView.automaticDimension
    v.estimatedRowHeight = 200
    return v
  }()
  
  // MARK: - Init.
  
  init(presenter: HeroesPresenter) {
    self.presenter = presenter
    
    super.init(nibName: nil, bundle: nil)
  }
    
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    
    setupView()
  }
  
  private func setupView() {
    view.addSubview(tableView)
    
    tableView.autoPinEdgesToSuperviewEdges()
  }
  
  // MARK: - View Controller life cycle.
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Marvel Heroes App"
        
    configureTableView()
  }
  
  // MARK: - UI config.
  
  private func configureTableView() {
    tableView.register(HeroesTableViewCell.self, forCellReuseIdentifier: HeroesTableViewCell.reuseIdentifier)
    
    tableView.dataSource = self
    tableView.delegate = self
  }
}

// MARK: - UITableViewDataSource

extension HeroesViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.getHeroesCount()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: HeroesTableViewCell.reuseIdentifier) as! HeroesTableViewCell
    cell.configure(presenter.getHero(atIndex: indexPath.row))
    return cell
  }
}

// MARK: - UITableViewDelegate

extension HeroesViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    coordinator?.showHeroDetailScreen(presenter.getHero(atIndex: indexPath.row))
  }
}
