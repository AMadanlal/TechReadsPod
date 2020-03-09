//
//  APICalls.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/03/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

// enum for errors
public enum Gameinfoerror: Error {
  case noDataAvailable
  case canNotProcessData
}

public protocol APICallsProtocol {

    func getGameList(completionHandler: @escaping(Result<GameList, Gameinfoerror>) -> Void)
    func getGameInfo( completionHandler: @escaping( Result<Game, Gameinfoerror>) -> Void)
}
