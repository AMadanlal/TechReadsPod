//
//  GameURLPath.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/04/21.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

class GameURLPath {
  let gameURL = "https://chicken-coop.p.rapidapi.com/games"

  func buildGameDetailsURLPath(name: String, platform: String) -> String {
    let gameName = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    let itemPlatform = platform.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    return "\(gameURL)/\(gameName ?? name)?platform=\(itemPlatform ?? platform)"
  }

  func buildGameListURLPath(searchQuery: String) -> String {
    let searchItem = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    return "\(gameURL)?title=\(searchItem ?? searchQuery)"
  }

}
