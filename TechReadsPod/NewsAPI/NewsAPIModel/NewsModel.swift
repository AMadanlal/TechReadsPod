//
//  News Model.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/04/17.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

public enum Newsinfoerror: Error {
  case noDataAvailable
  case canNotProcessData
}

//Codable Struct to represent JSON payload found at source:
//https://github.com/DanKorkelia/News-API-swift/blob/master/News-API%20Playground.playground/Contents.swift
public struct NewsSource: Codable {
    public var status: String?
    public var totalResults: Int?
    public struct Article: Codable {
       public var source: Source
       public var author: String?
       public var title: String?
       public var description: String?
       public var url: URL?
       public var urlToImage: URL?
       public var publishedAt: String?
        public struct Source: Codable {
          public var id: String?
          public var name: String?
          public init() { id = ""; name = ""}
        }
      public init() {
        source = Source()
        author = ""
        title = ""
        description = ""
        url = URL(string: "")
        urlToImage = URL(string: "")
        publishedAt = ""
      }
    }
    public var articles: [Article]
  public init() { status = ""; totalResults = 0; articles = [Article]() }
}
