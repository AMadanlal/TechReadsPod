//
//  GameInfoProcess.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/02/27.
//  Copyright © 2020 DVT. All rights reserved.
//
import UIKit
import Foundation

public class FormattingDisplayClass: DisplayProtocol {
  var gameModel: Game!
  var titleLabel: UILabel!
  var textView: UITextView!
  var imagePlace: UIImageView

  public init(gameM: Game, lblTitle: UILabel, txtView: UITextView, imgView: UIImageView) {
    gameModel = gameM
    titleLabel = lblTitle
    textView = txtView
    imagePlace = imgView
  }

   public func todisplay() {
      titleLabel.text = gameModel.title
  //this part formats the different string arrays better
      let simplifiedGenreString = stringArrayFormatter(textArray: gameModel.genre)
      let simplifiedPublisherString =  stringArrayFormatter(textArray: gameModel.publisher)
      let simplifiedConsoleString = stringArrayFormatter(textArray: gameModel.alsoAvailableOn)
  //the next string contains the content to be shown to the user in a specific format
      let fullText = """
      Release Date: \(gameModel.releaseDate)
      Genres: \(simplifiedGenreString)
      Developer: \(gameModel.developer)
      Publisher: \(simplifiedPublisherString)
      Also Available on: \(simplifiedConsoleString)
      Rating: \(gameModel.rating)
      Description: \(gameModel.description)
      Score: \(gameModel.score)
      """
//    this is to load the image onto the page
      loadimage()
//  this line assigns the formatted text to the description UITextView
      textView.text = fullText
    }

  func loadimage() {
    guard let imageURL = URL(string: gameModel.image) else { return }
    DispatchQueue.global().async {
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        let image = UIImage(data: imageData)
        DispatchQueue.main.async {
          self.imagePlace.image = image
        }
    }
  }

  func stringArrayFormatter(textArray: [String]) -> String {
    var formattedString: String = ""
    for text in textArray {
      if text == textArray[textArray.count-1] {
        formattedString += text
      } else {
        formattedString += text + ", "
      }
    }
    return formattedString
  }

}
