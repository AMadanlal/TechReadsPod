//
//  ChickenCoopMockAPI.swift
//  TechReadsPodTests
//
//  Created by Akshar Madanlal on 2020/03/09.
//  Copyright © 2020 DVT. All rights reserved.
//
import Foundation
import TechReadsPod

public class ChickenCoopMockAPI: APICallsProtocol {
  var gamemodel: Game!
  var gamelist: GameList!
  public func getGameList(completionHandler: @escaping (Result<GameList, Gameinfoerror>) -> Void) {
    gamelist = GameList()
    gamelist.query = ""
    gamelist.executionTime = 0
    gamelist.countResult = 0
    gamelist.result = [GameListItem]()
    completionHandler(.success(gamelist))
  }
  public func getGameInfo(completionHandler: @escaping (Result<Game, Gameinfoerror>) -> Void) {
    gamemodel = Game()
    gamemodel.title = "Mock Game"
    gamemodel.releaseDate = "22/03/1987"
    gamemodel.description = "A Mock GAme used for testing"
    gamemodel.genre = [String]()
    gamemodel.image = "Insert URL of image here"
    gamemodel.score = 50
    gamemodel.developer = "Myself"
    gamemodel.publisher = [String]()
    gamemodel.rating = "E"
    gamemodel.alsoAvailableOn = [String]()
    completionHandler(.success(gamemodel))
  }
}
