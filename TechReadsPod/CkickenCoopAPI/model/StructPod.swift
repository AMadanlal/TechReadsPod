//
//  StructPod.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/02/25.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

// enum for errors
public enum Gameinfoerror: Error {
  case noDataAvailable
  case canNotProcessData
}

//  struct for the gamelist items
  public struct GameListItem: Decodable {
    public var title: String
    public var platform: String
    public init() {
      title = ""
      platform = ""
    }
  }

//  struct for the gamelist
  public struct GameList: Decodable {
    public var query: String
    public var executionTime: Double
    public var result = [GameListItem]()
    public var countResult: Int
    public init() {
      query = ""
      executionTime = 0
      countResult = 0
    }
  }

  public struct Gameresponse: Decodable {
    public var query: String
    public var executionTime: Double
    public var result = Game()
    public init() {
      query = ""
      executionTime = 0
    }
  }

//  this is a struct to store the individual game data
  public struct Game: Decodable {
    public var title: String
    public var releaseDate: String
    public var description: String
    public var genre = [String]()
    public var image: String
    public var score: Int
    public var developer: String
    public var publisher = [String]()
    public var rating: String
    public var alsoAvailableOn = [String]()
    public init() {
      title = ""
      releaseDate = ""
      description = ""
      image = ""
      score = 0
      developer = ""
      rating = ""
    }
}
