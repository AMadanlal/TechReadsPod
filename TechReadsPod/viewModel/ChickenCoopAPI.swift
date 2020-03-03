//
//  ChickenCoopAPI.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

public class ChickenCoopAPI {
// enum for errors
  public enum Gameinfoerror: Error {
    case noDataAvailable
    case canNotProcessData
  }

//  class variables
  public var searchItem: String = ""
  public var gamePlatform: String = "pc" //this is made public in order for the other class to modify it
  public var gamedetails = Game()
  public var gamelist = GameList()
//  this is the headers that include the host and the unique key given to a user to access the api
  let headers = ["x-rapidapi-host": "chicken-coop.p.rapidapi.com",
                  "x-rapidapi-key": "20e0c6a126msh31a394fe35837d8p1d97f3jsn9bf6099a1b56"]

  public init(searched: String, platform: String) {
    searchItem = searched
    gamePlatform = platform
  }

//  this gets the individual game information
   public func getGameInfo( completionHandler: @escaping( Result<Game, Gameinfoerror>) -> Void) {
//    create the initial request for the data using API documentation
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
    var formattedplatform = ""
    switch(gamePlatform) {
      case "PC":
        formattedplatform = "pc"
      case "PS4":
        formattedplatform = "playstation-4"
      case "XONE":
        formattedplatform = "xbox-one"
      case "Stadia":
        formattedplatform = "stadia"
      case "Switch":
        formattedplatform = "switch"
      case "3DS":
        formattedplatform = "3ds"
      case "X360":
        formattedplatform = "xbox360"
      case "WIIU":
        formattedplatform = "wii-u"
      case "VITA":
        formattedplatform = "playstation-vita"
      case "PSP":
        formattedplatform = "psp"
      case "GBA":
        formattedplatform = "game-boy-advance"
      case "PS2":
        formattedplatform = "playstation-2"
      case "PS3":
        formattedplatform = "playstation-3"
      case "DS":
        formattedplatform = "ds"
      case "iOS":
      formattedplatform = "ios"
      default:
      print(gamePlatform)
      
    }
   
    
    let request = NSMutableURLRequest(url: NSURL(
      string: "https://chicken-coop.p.rapidapi.com/games" +
      "/\(searchItem.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")" +
        "?platform=\(formattedplatform.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")" +
      "")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
//    create the session
    let session = URLSession.shared
//    make the call an get the data
    let dataTask = session.dataTask(with: request as URLRequest) { data, _, _ in
      guard let jsonData = data else {
        completionHandler(.failure(.noDataAvailable))
        return
      }
      do {
        let decoder = JSONDecoder()
        let gameresponse = try decoder.decode(Gameresponse.self, from: jsonData)
//        gameresponsedetails contain all the information of the game
        let gameresponsedetails = gameresponse.result
        completionHandler(.success(gameresponsedetails))
        //the previous line allows values obtained when doing async instructions to be returned
        } catch {
          print(jsonData)
          completionHandler(.failure(.canNotProcessData))
        }
      }
    dataTask.resume()
  }

//  this function gets the list of games
   public func getGameList(completionHandler: @escaping(Result<GameList, Gameinfoerror>) -> Void) {
//    remember to format the search item to support spaces in url format
    let request = NSMutableURLRequest(url: NSURL(string:
    "https://chicken-coop.p.rapidapi.com/games?title=" +
      "\(searchItem.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")" +
      "")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest) { data, _, _ in
      guard let jsonData = data else {
        completionHandler(.failure(.noDataAvailable))
        return
      }
      do {
        let decoder = JSONDecoder()
        let gamelistresponse = try decoder.decode(GameList.self, from: jsonData)
        completionHandler(.success(gamelistresponse))
      } catch {
        print(jsonData)
        completionHandler(.failure(.canNotProcessData))
      }
    }
    dataTask.resume()
  }
}
