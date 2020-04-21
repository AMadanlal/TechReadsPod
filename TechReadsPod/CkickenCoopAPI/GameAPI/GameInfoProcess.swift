//
//  GameInfoProcess.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/02/27.
//  Copyright © 2020 DVT. All rights reserved.
//
import UIKit
import Foundation

public class GameInfoProcess {

  public init() { }

  func textDisplay(game: Game) -> String {
    let simplifiedGenreString = stringArrayFormatter(textArray: game.genre)
    let simplifiedPublisherString =  stringArrayFormatter(textArray: game.publisher)
    let simplifiedConsoleString = stringArrayFormatter(textArray: game.alsoAvailableOn)
    let fullText = """
    Release Date: \(game.releaseDate)
    Genres: \(simplifiedGenreString)
    Developer: \(game.developer)
    Publisher: \(simplifiedPublisherString)
    Also Available on: \(simplifiedConsoleString)
    Rating: \(game.rating)
    Description: \(game.description)
    Score: \(game.score)
    """
    return fullText
  }

  public func stringArrayFormatter(textArray: [String]) -> String {
    var formattedString: String = ""
    for text in textArray {
      if text == textArray[textArray.count-1] {
        formattedString += text
      } else {
        formattedString += text + ", "
      }
    }
    return formattedString
  }

  // swiftlint:disable cyclomatic_complexity
  func formatplatformstring(stringtoformat: String) -> String {
    /* here we will have to create a switch ststement for the different consoles in the format origtext -> apicalltext
     PC -> pc
     PlayStation 4 -> playstation-4
     Xbox One -> xbox-one
     Stadia -> stadia
     Switch -> switch
     3DS -> 3ds
     X360 -> xbox360
     WIIU -> wii-u
     VITA -> playstation-vita
     PSP -> psp
     GBA -> game-boy-advance
     PS2 -> playstation-2
     PS3 -> playstation-3
     DS -> ds
     */
    switch stringtoformat {
    case "PC":
      return "pc"
    case "PS4":
      return "playstation-4"
    case "XONE":
      return "xbox-one"
    case "Stadia":
      return "stadia"
    case "Switch":
      return "switch"
    case "3DS":
      return "3ds"
    case "X360":
      return "xbox360"
    case "WIIU":
      return "wii-u"
    case "VITA":
      return "playstation-vita"
    case "PSP":
      return "psp"
    case "GBA":
      return "game-boy-advance"
    case "PS2":
      return "playstation-2"
    case "PS3":
      return "playstation-3"
    case "DS":
      return "ds"
    case "iOS":
      return "ios"
    default:
      return stringtoformat
    }
    //    swiftlint was disabled in this function as it displayed a warning saying the switch statement is too complex
    // swiftlint:enable cyclomatic_complexity
  }

}
