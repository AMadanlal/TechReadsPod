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
    public let status: String?
    public let totalResults: Int?
    public struct Article: Codable {
       public let source: Source
       public let author: String?
       public let title: String?
       public let description: String?
       public let url: URL?
       public let urlToImage: URL?
       public let publishedAt: String?
        public struct Source: Codable {
          public let id: String?
          public let name: String?
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
    public let articles: [Article]
  public init() { status = ""; totalResults = 0; articles = [Article]() }
}
