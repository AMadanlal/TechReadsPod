//
//  ChickenCoopAPI.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation
public class ChickenCoopAPI {

  let headers = ["x-rapidapi-host": "chicken-coop.p.rapidapi.com",
                  "x-rapidapi-key": "20e0c6a126msh31a394fe35837d8p1d97f3jsn9bf6099a1b56"]

  public init() { }

  public func getGameInfo(gameTitle: String, gamePlatform: String,
                          completionHandler: @escaping(Result<Game, Gameinfoerror>) -> Void) {
    let textProcessor = GameInfoProcess()
    let formattedplatform = textProcessor.formatplatformstring(stringtoformat: gamePlatform)
    let gameURL = GameURLPath()
    let urlString = gameURL.buildGameDetailsURLPath(name: gameTitle, platform: formattedplatform)
    guard let url = URL(string: urlString) else { return }
    var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 12.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest) { data, _, _ in
      guard let jsonData = data else {
      completionHandler(.failure(.noDataAvailable("Data could not be obtained at the moment")))
      return
      }
      do {
        let decoder = JSONDecoder()
        let gameresponse = try decoder.decode(Gameresponse.self, from: jsonData)
        let gameresponsedetails = gameresponse.result
          completionHandler(.success(gameresponsedetails))
        } catch {
          completionHandler(.failure(.canNotProcessData("Data is of unknown type")))
        }
      }
    dataTask.resume()
  }

  public func getGameList(searchItem: String, completionHandler: @escaping(Result<GameList, Gameinfoerror>) -> Void) {
    let gameURL = GameURLPath()
    let urlString = gameURL.buildGameListURLPath(searchQuery: searchItem)
    guard let url = URL(string: urlString) else { return }
    var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 12.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest) { data, _, _ in
      guard let jsonData = data else {
      completionHandler(.failure(.noDataAvailable("Data could not be obtained at the moment")))
      return
      }
      do {
        let decoder = JSONDecoder()
        let gamelistresponse = try decoder.decode(GameList.self, from: jsonData)
        completionHandler(.success(gamelistresponse))
      } catch {
        print(jsonData)
        completionHandler(.failure(.canNotProcessData("Data is of unknown type")))
      }
    }
    dataTask.resume()
  }

  public func getRandomGameListItem(gameList: GameList) -> GameListItem {
    let utillities = SavingUtilities.init()
    let platformSearch = utillities.loadMedium()
    let platformFilteredGameList = gameList.result.filter {$0.platform == platformSearch}
    var randomGameListItem = GameListItem()
    randomGameListItem.platform = "pc"
    randomGameListItem.title = "Crysis"
    if platformFilteredGameList.isEmpty {
      guard let validListItem = gameList.result.randomElement() else { return randomGameListItem}
      randomGameListItem = validListItem
    } else {
      guard let validListItem = platformFilteredGameList.randomElement() else { return randomGameListItem}
      randomGameListItem = validListItem
    }
    return randomGameListItem
  }

}
