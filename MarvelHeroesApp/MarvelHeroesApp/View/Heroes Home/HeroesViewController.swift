//
//  HeroesViewController.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 31/03/2022.
//

import UIKit
import PureLayout
import Moya

class HeroesViewController: BaseViewController {
  
  private var presenter: HeroesPresenter
  
  // MARK: - UI props.
  
  private lazy var tableView: UITableView = {
    let v = UITableView()
    v.backgroundColor = Theme.Colors.secondary
    v.rowHeight = UITableView.automaticDimension
    v.estimatedRowHeight = 200
    return v
  }()
  
  private lazy var emptyHeroesViewTitle: UILabel = {
    let v = UILabel()
    v.text = "No heroes found, the world is in danger!!!\n\nTo search for heroes again, press the button"
    v.textAlignment = .center
    v.font = UIFont.systemFont(ofSize: 24)
    v.numberOfLines = 0
    return v
  }()
  
  private lazy var emptyHeroesViewButton: UIButton = {
    let v = UIButton(type: .system)
    v.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    v.setTitle("Find Heroes", for: .normal)
    v.backgroundColor = Theme.Colors.main
    v.setTitleColor(Theme.Colors.primaryText, for: .normal)
    v.layer.cornerRadius = 5
    v.layer.masksToBounds = true
    return v
  }()
  
  private lazy var emptyHeroesView: UIStackView = {
    let v = UIStackView()
    v.axis = .vertical
    v.spacing = 30
    v.addArrangedSubview(emptyHeroesViewTitle)
    v.addArrangedSubview(emptyHeroesViewButton)
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
    
    view.addSubview(emptyHeroesView)
    emptyHeroesView.autoPinEdge(.leading, to: .leading, of: view, withOffset: 30)
    emptyHeroesView.autoPinEdge(.trailing, to: .trailing, of: view, withOffset: -30)
    emptyHeroesView.autoAlignAxis(.horizontal, toSameAxisOf: view, withOffset: -50)
  }
  
  // MARK: - View Controller life cycle.
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Marvel Heroes App"
        
    configureTableView()
    configureEmptyHeroesView()
    configurePresenter()
  }
  
  // MARK: - UI and presenter config.
  
  private func configureTableView() {
    tableView.register(HeroesTableViewCell.self, forCellReuseIdentifier: HeroesTableViewCell.reuseIdentifier)
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  private func configureEmptyHeroesView() {
    emptyHeroesViewButton.addTarget(self, action: #selector(findHeroesButtonPressed), for: .touchUpInside)
    
    emptyHeroesView.isHidden = true
  }
  
  private func configurePresenter() {
    presenter.delegate = self
    presenter.fetchHeroes()
  }
  
  // MARK: - Actions.
  @objc func findHeroesButtonPressed() {
    presenter.fetchHeroes()
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
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row + 1 == presenter.getHeroesCount() {
      presenter.fetchHeroes()
    }
  }
}

// MARK: - UITableViewDelegate

extension HeroesViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    coordinator?.showHeroDetailScreen(presenter.getHero(atIndex: indexPath.row))
  }
}

// MARK: - HeroesPresenterDelegate

extension HeroesViewController: HeroesPresenterDelegate {
    
  func showLoader(_ presenter: HeroesPresenter) {
    showLoader()
  }
  
  func hideLoader(_ presenter: HeroesPresenter) {
    hideLoader()
  }
  
  func loadedHeroes(_ presenter: HeroesPresenter, heroes: [Hero]) {
    tableView.reloadData()
  }
  
  func showError(_ presenter: HeroesPresenter, errorMessage: String) {
    showError(errorMessage: errorMessage)
  }
  
  func showEmptyHeroesView(_ presenter: HeroesPresenter) {
    emptyHeroesView.isHidden = false
  }
  
  func hideEmptyHeroesView(_ presenter: HeroesPresenter) {
    emptyHeroesView.isHidden = true
  }
}
