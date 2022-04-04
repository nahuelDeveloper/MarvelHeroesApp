//
//  HeroesTableViewCell.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 03/04/2022.
//

import UIKit
import PureLayout

class HeroesTableViewCell: UITableViewCell {
  
  static var reuseIdentifier: String {
    return String(describing: HeroesTableViewCell.self)
  }
  
  // MARK: - UI props.
  
  private lazy var heroImageView: UIImageView = {
    let v = UIImageView()
    v.image = UIImage(named: "ic_placeholder")
    return v
  }()
  
  private lazy var heroNameLabel: UILabel = {
    let v = UILabel()
    v.font = UIFont.systemFont(ofSize: 24)
    return v
  }()
    
  // MARK: - Init.
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupView()
  }
    
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - UI setup.
  
  private func setupView() {
    contentView.addSubview(heroImageView)
    contentView.addSubview(heroNameLabel)
    
    heroImageView.autoPinEdge(.top, to: .top, of: contentView, withOffset: 20)
    heroImageView.autoAlignAxis(toSuperviewAxis: .vertical)
    heroImageView.autoSetDimension(.width, toSize: 150)
    heroImageView.autoSetDimension(.height, toSize: 150)
    
    heroNameLabel.autoPinEdge(.top, to: .bottom, of: heroImageView, withOffset: 20)
    heroNameLabel.autoAlignAxis(toSuperviewAxis: .vertical)
    heroNameLabel.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -20)
  }
  
  // MARK: - Configure.
  
  func configure(_ hero: Hero) {
    heroNameLabel.text = hero.name
  }
  
  // MARK: - Cell reuse.
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    heroNameLabel.text = nil
  }
}
