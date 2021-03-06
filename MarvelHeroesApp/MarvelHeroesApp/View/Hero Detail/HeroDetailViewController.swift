//
//  HeroDetailViewController.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 08/04/2022.
//

import UIKit
import PureLayout

class HeroDetailViewController: BaseViewController {
  
  private var presenter: HeroDetailPresenter
  
  // MARK: - UI props.
  
  lazy var scrollView: UIScrollView = {
    let v = UIScrollView()
    return v
  }()
  
  lazy var containerView: UIView = {
    let v = UIView()
    return v
  }()
  
  lazy var heroImageView: UIImageView = {
    let v = UIImageView()
    v.contentMode = .scaleAspectFit
    return v
  }()
  
  lazy var heroInfoStackView: UIStackView = {
    let v = UIStackView()
    v.axis = .vertical
    v.spacing = 20.0
    return v
  }()
  
  lazy var heroNameLabel: UILabel = {
    let v = UILabel()
    v.textColor = .white
    v.font = UIFont.boldSystemFont(ofSize: 26.0)
    return v
  }()
  
  lazy var heroDescriptionLabel: UILabel = {
    let v = UILabel()
    v.textColor = .white
    v.font = UIFont.systemFont(ofSize: 16.0)
    v.numberOfLines = 0
    return v
  }()
    
  // MARK: - Init.
  
  init(presenter: HeroDetailPresenter) {
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
    view.addSubview(scrollView)
    scrollView.autoPinEdgesToSuperviewEdges()
    scrollView.autoSetDimension(.width, toSize: view.bounds.width)
    
    scrollView.addSubview(containerView)
    containerView.autoPinEdgesToSuperviewEdges()
    containerView.autoMatch(.width, to: .width, of: scrollView)
    
    containerView.addSubview(heroImageView)
    heroImageView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
    heroImageView.autoSetDimension(.height, toSize: UIScreen.main.bounds.width)
    
    containerView.addSubview(heroInfoStackView)
    heroInfoStackView.autoPinEdge(.top, to: .bottom, of: heroImageView, withOffset: 30.0)
    heroInfoStackView.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 30.0)
    heroInfoStackView.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -30.0)
    heroInfoStackView.autoPinEdge(.bottom, to: .bottom, of: containerView, withOffset: -30.0)
    
    heroInfoStackView.addArrangedSubview(heroNameLabel)
    heroInfoStackView.addArrangedSubview(heroDescriptionLabel)
    heroInfoStackView.addArrangedSubview(UIView())
  }
  
  // MARK: - View Controller life cycle.
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    heroImageView.addBlackGradientLayerInForeground()
  }
  
  private func configureView() {
    self.title = "Hero Detail"
    
    heroNameLabel.text = presenter.getHeroName()
    heroDescriptionLabel.text = presenter.getHeroDescription()

    heroImageView.loadImage(presenter.getHeroImage())
  }
}
