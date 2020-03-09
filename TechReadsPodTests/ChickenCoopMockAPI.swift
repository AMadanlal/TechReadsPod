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
    gamelist.result = [GameListItem()]
    completionHandler(.success(gamelist))
  }
  public func getGameInfo(completionHandler: @escaping (Result<Game, Gameinfoerror>) -> Void) {
    _ = Gameresponse()
    gamemodel = Game()
    gamemodel.title = "Mock Game"
    gamemodel.releaseDate = "22/03/1987"
    gamemodel.description = "A Mock GAme used for testing"
    gamemodel.genre = ["fps", "tps", "racing"]
    gamemodel.image = "Insert URL of image here"
    gamemodel.score = 50
    gamemodel.developer = "Myself"
    gamemodel.publisher = ["EA", "UBISOFT"]
    gamemodel.rating = "E"
    gamemodel.alsoAvailableOn = ["xbox", "ps3"]
    completionHandler(.success(gamemodel))
  }
}
