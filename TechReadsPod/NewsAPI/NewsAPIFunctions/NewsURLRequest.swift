//
//  NewsURLFile.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/04/20.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

class NewsURLRequest {
  var newsURL = "https://newsapi.org/v2/top-headlines?country=za"
  var urlPageSize = "20"
  let apiKey = "db03aae8ea77408ab75aa849fae46298"
  let catagory = "technology"
  var searchText = ""

  public init() { }
  public init(itemtoSearch: String) { searchText = itemtoSearch}

  public func getNewsUrlRequest() -> URLRequest {
    var request = URLRequest(url: URL(string: newsURL)! as URL,
                             cachePolicy: .useProtocolCachePolicy,
                             timeoutInterval: 10.0)
    let headers = ["pageSize": urlPageSize,
                   "category": catagory,
                   "apiKey": apiKey]
    request.allHTTPHeaderFields = headers
    request.httpMethod = "GET"
    return request
  }

}
