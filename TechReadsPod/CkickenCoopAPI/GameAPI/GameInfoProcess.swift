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

  public func textDisplay(game: Game) -> String {
    return """
    Release Date: \(game.releaseDate)
    Genres: \(stringArrayFormatter(textArray: game.genre))
    Developer: \(game.developer)
    Publisher: \(stringArrayFormatter(textArray: game.publisher))
    Also Available on: \(stringArrayFormatter(textArray: game.alsoAvailableOn))
    Rating: \(game.rating)
    Description: \(game.description)
    Score: \(game.score)
    """
  }

  public func stringArrayFormatter(textArray: [String]) -> String {
        var formattedString: String = ""
    for (index, text) in textArray.enumerated() {
      if index == textArray.count-1 {
        formattedString += text
      } else {
        formattedString += text + ", "
      }
    }
    return formattedString
  }

  // swiftlint:disable cyclomatic_complexity
  public func formatPlatformString(stringtoformat: String) -> String {
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
