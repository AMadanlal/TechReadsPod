//
//  PreferencesManagement.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/02/26.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

public class FileManagement {
  public let file = "UserMedium.txt" //this is the name of the file for the user medium
  public let genrefile = "UserGenres.txt" //this is the name of the file with the user genres
     //      this is to load the data from the file
  public func loadmedium() -> String {
        var consolepref = ""
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileurl = dir.appendingPathComponent(file)
        do {
          let datafromfile = try String(contentsOf: fileurl, encoding: .utf8)
          consolepref = datafromfile
        } catch {
          print(error)
        }
      }
    return consolepref
  }
//  the following function is to save the console preference to a file
  public func savemedium(medium: String) {
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
      let fileurl = dir.appendingPathComponent(file)
      do {
        try medium.write(to: fileurl, atomically: false, encoding: .utf8)
      } catch {
        print(error)
      }
    }
  }
//  this function loads genres onto the page
  public func loadGenre() -> String {
    var genrestring = " "
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
         let fileurl = dir.appendingPathComponent(genrefile)
         do {
           let datafromfile = try String(contentsOf: fileurl, encoding: .utf8)
           genrestring = datafromfile
         } catch {
           print(error)
           genrestring = "List of Genre's: "
         }
       }
    return genrestring
  }
//  this function saves the genre to the file
  public func saveGenre(genretosave: String) {
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
         let fileurl = dir.appendingPathComponent(genrefile)
         do {
           try genretosave.write(to: fileurl, atomically: false, encoding: .utf8)
         } catch {
           print(error)
         }
       }
  }
  
}
