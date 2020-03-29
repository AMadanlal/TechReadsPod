//
//  RandomGameReview.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/03/27.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
public class RandomGameReview {

  public func getRandomGameFromList(completionHandler: @escaping(GameListItem) -> Void) {
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
          if compatableGameList.count == 1 {
             listItem = compatableGameList[0]
          } else if compatableGameList.count > 1 {
            let randomInt = Int.random(in: 0..<compatableGameList.count)
  //            insert random game from the list here
            listItem = compatableGameList[randomInt]
          } else if compatableGameList.count == 0 {
            let randomInt = Int.random(in: 0..<gameList.result.count)
            listItem  = gameList.result[randomInt]
          }
        }
      }
    }
      completionHandler(listItem)
  }
}
