//
//  NewsURLFile.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/04/20.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

class NewsURLPath {
  let newsURL = "https://newsapi.org/v2/"
  let country = "za"
  var urlPageSize = "10"
  let apiKey = "db03aae8ea77408ab75aa849fae46298"
  let catagory = "technology"

  public init() { }

  func buildTechNewsPath(query: String?) -> String {
    if let query = query {
      return "\(newsURL)top-headlines?country=\(country)&category=\(catagory)&q=\(query)&pagesize=\(urlPageSize)"
      + "&apiKey=\(apiKey)"
    } else {
      return "\(newsURL)top-headlines?country=\(country)&category=\(catagory)&pagesize=\(urlPageSize)&apiKey=\(apiKey)"
    }
  }

}
