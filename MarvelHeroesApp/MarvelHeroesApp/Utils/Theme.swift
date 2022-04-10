//
//  Theme.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 09/04/2022.
//

import UIKit

struct Theme {
  
  struct Colors {
    static var main: UIColor { Palette.marvelRed }
    static var secondary: UIColor { Palette.marvelDarkGray }
  }
  
  private struct Palette {
    static var marvelRed: UIColor { hexStringToUIColor(hex: "#DA3831") }
    static var marvelDarkGray: UIColor { hexStringToUIColor(hex: "#202020") }
  }
  
  static func hexStringToUIColor(hex: String) -> UIColor {
    var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
      cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
      return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
}
