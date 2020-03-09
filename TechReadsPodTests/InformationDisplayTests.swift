//
//  ChickenCoopAPITest.swift
//  TechReadsPodTests
//
//  Created by Akshar Madanlal on 2020/03/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest
@testable import TechReadsPod

class CheckenCoopAPITests: XCTestCase {
  var titlelabel: UILabel!
  var textview: UITextView!
  var imageplace: UIImageView!
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    titlelabel = UILabel()
    textview = UITextView()
    imageplace = UIImageView()
  }
  func testDisplay() {
    let mockAPI = ChickenCoopMockAPI()
    var gameinfo = Game()
    mockAPI.getGameInfo { result in
                  switch result {
                  case .failure(let error):
                    print(error)
                  case.success(let details):
                      gameinfo = details
                      print(details)
                          todisplay(gamemodel: gameinfo, titlelabel: self.titlelabel, textview: self.textview,
                                    imageplace: self.imageplace)
                          XCTAssertEqual(self.titlelabel.text, gameinfo.title)
          }
        }
      }
     override func tearDown() {
          // Put teardown code here. This method is called after the invocation of each test method in the class.
      titlelabel = nil
      textview = nil
      imageplace = nil
      }

      func testPerformanceExample() {
          // This is an example of a performance test case.
  //        measure {
  //            // Put the code you want to measure the time of here.
  //        }
      }
}
