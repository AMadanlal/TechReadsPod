//
//  NewsAPICalls.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/04/17.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

public class NewsAPICalls {

  public init() { }

  public func getCustomNewsList(searchitem: String, completionHandler: @escaping(Result<NewsSource, Newsinfoerror>) ->
       Void) {
    let formattedSearchString = searchitem.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
       let request = NSMutableURLRequest(url: NSURL(string: "https://newsapi" +
        ".org/v2/top-headlines?country=za&category=technology&q=\(formattedSearchString ?? "")&" +
         "pagesize=10&apiKey=db03aae8ea77408ab75aa849fae46298")! as URL,
                                         cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
       request.httpMethod = "GET"
   //    NOT PUTTING HEADERS AS THEY ARE ALREADY IN THE URL STRING
       let session = URLSession.shared
       let dataTask = session.dataTask(with: request as URLRequest) { data, _, _ in
         guard let jsonData = data else {
           let error = Newsinfoerror.noDataAvailable("Data could not be obtained at the moment")
           completionHandler(.failure(error))
           return
         }
         do {
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .iso8601
          let newsResponse = try decoder.decode(NewsSource.self, from: jsonData)
          completionHandler(.success(newsResponse))
         } catch {
          let error = Newsinfoerror.canNotProcessData("Data is of unknown type")
          completionHandler(.failure(error))
         }
       }
        dataTask.resume()
     }

  public func getNewsList(completionHandler: @escaping(Result<NewsSource, Newsinfoerror>) ->
      Void) {
      let requestClass = NewsURLRequest()
      let request = requestClass.getNewsUrlRequest()
  //    NOT PUTTING HEADERS AS THEY ARE ALREADY IN THE URL STRING
      let session = URLSession.shared
      let dataTask = session.dataTask(with: request as URLRequest) { data, _, _ in
      guard let jsonData = data else {
        let error = Newsinfoerror.noDataAvailable("Data could not be obtained at the moment")
        completionHandler(.failure(error))
        return
        }
        do {
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .iso8601
          let newsResponse = try decoder.decode(NewsSource.self, from: jsonData)
          completionHandler(.success(newsResponse))
        } catch {
          let error = Newsinfoerror.canNotProcessData("Data is of unknown type")
          completionHandler(.failure(error))
        }
      }
        dataTask.resume()
    }

  public func getRandomArticle(allArticles: NewsSource) -> NewsSource.Article {
    return allArticles.articles.randomElement() ?? NewsSource.Article()
  }

  public func getArticleTextFormat(theArticle json: NewsSource.Article,
                                   completionHandler: @escaping(String) -> Void) {
        let urlString: String = "https://techreadsapi.herokuapp.com/NewsArticleFormatter"
        let jsonData = try? JSONEncoder().encode(json)
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
          print(error?.localizedDescription ?? "No data")
          return
        }
        let responseJSON = String(data: data, encoding: .utf8)
        if let responseJSON = responseJSON {
          completionHandler(responseJSON) //return the article in a completion handler
          }
        }
       task.resume()
  }
}
