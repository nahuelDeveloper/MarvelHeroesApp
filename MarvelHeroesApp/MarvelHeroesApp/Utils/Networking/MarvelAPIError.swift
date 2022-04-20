//
//  MarvelAPIError.swift
//  MarvelHeroesApp
//
//  Created by Nahuel on 19/04/2022.
//

import Foundation

private let kApiGenericErrorMessage = "Ha ocurrido un error. Intente nuevamente mas tarde"

enum MarvelAPIError: Error {
  case apiGenericError
  case apiFailure
  case reachedFinalPage
  case apiError(errorResponse: MarvelAPIErrorResponse)
  
  var errorMessage: String {
    switch self {
    case .apiError(let errorResponse):
      return "\(errorResponse.message)\n[\(errorResponse.code)]"
    default:
      return kApiGenericErrorMessage
    }
  }
}
