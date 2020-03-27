//
//  RandomGameReview.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/03/27.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
public class RandomGameReview {

  public func getRandomGameFromList() -> GameListItem {
    let utillities = SavingUtilities.init()
    var listItem = GameListItem()
    var compatableGameList = [GameListItem]()
    let platformSearch = utillities.loadMedium()
    let apiClass = ChickenCoopAPI(searched: "", platform: platformSearch ?? "pc")
    apiClass.getGameList { result in
      switch result {
      case.failure(let error):
        print(error)
      case.success(let details):
        let gameList = details
        DispatchQueue.main.async {
          for item in gameList.result where item.platform == platformSearch {
              compatableGameList.append(item)
          }
          if compatableGameList.count == 0 {
//            insert random game from the list here
          } else if compatableGameList.count == 1 {
            listItem = compatableGameList.first! //explicit unwrapping... find a way around it
          }
        }
      }
    }
      return listItem
  }
}
