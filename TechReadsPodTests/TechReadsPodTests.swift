//
//  TechReadsPodTests.swift
//  TechReadsPodTests
//
//  Created by Akshar Madanlal on 2020/03/05.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest
@testable import TechReadsPod

class TechReadsPodTests: XCTestCase {
  var gamemodel: Game!
  var titlelabel: UILabel!
  var textview: UITextView!
  var imageplace: UIImageView!
  var APIClass: ChickenCoopAPI!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      gamemodel = Game()
      APIClass = ChickenCoopAPI(searched: "Mock Game", platform: "Any")
      gamemodel.title = "Mock Game"
      gamemodel.releaseDate = "22/03/1987"
      gamemodel.description = "A Mock GAme used for testing"
      gamemodel.genre = [String]()
      gamemodel.image = "Insert URL of image here"
      gamemodel.score = 50
      gamemodel.developer = "Myself"
      gamemodel.publisher = [String]()
      gamemodel.rating = "E"
      gamemodel.alsoAvailableOn = [String]()
      titlelabel = UILabel()
      textview = UITextView()
      imageplace = UIImageView()
    }
  func testFormatPlatformStringPC() {
//    GIVEN
    let platform = "PC"
//    WHEN
    let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
//    THEN
    XCTAssertEqual(formattedplatform, "pc")
  }
  func testFormatPlatformStringPS4() {
    
  }
  func testFormatPlatformStringXONE() {
    
  }
  func testFormatPlatformStringSTADIA() {
    
  }
  func testFormatPlatformStringSWITCH() {
    
  }
  func testFormatPlatformString3DS() {
    
  }
  func testFormatPlatformStringX360() {
    
  }
  func testFormatPlatformStringWIIU() {
    
  }
  func testFormatPlatformStringVITA() {
    
  }
  func testFormatPlatformStringPSP() {
    
  }
  func testFormatPlatformStringGBA() {
    
  }
  func testFormatPlatformStringPS2() {
    
  }
  func testFormatPlatformStringPS3() {
    
  }
  func testFormatPlatformStringDS() {
    
  }
  func testFormatPlatformStringIOS() {
    
  }
  func testFormatPlatformStringDEFAULT() {
    
  }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      gamemodel = nil
         titlelabel = nil
         textview = nil
         imageplace = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
    }

}
