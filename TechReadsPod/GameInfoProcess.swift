//
//  GameInfoProcess.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/02/27.
//  Copyright © 2020 DVT. All rights reserved.
//
import UIKit
import Foundation

func todisplay(gamemodel: Game, titlelabel: UILabel, textview: UITextView, imageplace: UIImageView) {
     titlelabel.text = gamemodel.title
 //this part formats the different string arrays better
     var simplifiedgenrestring = ""
     for gen in gamemodel.genre {
       if gen == gamemodel.genre[gamemodel.genre.count-1] {
           simplifiedgenrestring += gen
         } else {
           simplifiedgenrestring += gen + ", "
         }
       }
     var simplifiedpublisherstring = ""
     for pub in gamemodel.publisher {
     if pub == gamemodel.publisher[gamemodel.publisher.count-1] {
         simplifiedpublisherstring += pub
       } else {
         simplifiedpublisherstring += pub + ", "
       }
     }
     var simplifiedconsolestring = ""
     for console in gamemodel.alsoAvailableOn {
     if console == gamemodel.alsoAvailableOn[gamemodel.alsoAvailableOn.count-1] {
         simplifiedconsolestring += console
       } else {
         simplifiedconsolestring += console + ", "
       }
     }
 //the next string contains the content to be shown to the user in a specific format
     let fulltext = """
     Release Date: \(gamemodel.releaseDate)
     Genres: \(simplifiedgenrestring)
     Developer: \(gamemodel.developer)
     Publisher: \(simplifiedpublisherstring)
     Also Available on: \(simplifiedconsolestring)
     Rating: \(gamemodel.rating)
     Description: \(gamemodel.description)
     Score: \(gamemodel.score)
     """
 //    this is to load the image onto the page
     guard let imageURL = URL(string: gamemodel.image) else { return }
     DispatchQueue.global().async {
         guard let imageData = try? Data(contentsOf: imageURL) else { return }
         let image = UIImage(data: imageData)
         DispatchQueue.main.async {
             imageplace.image = image
         }
     }
     textview.text = fulltext
   }
