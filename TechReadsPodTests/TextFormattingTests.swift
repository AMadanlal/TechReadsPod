//
//  TechReadsPodTests.swift
//  TechReadsPodTests
//
//  Created by Akshar Madanlal on 2020/03/05.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest
@testable import TechReadsPod

class TextFormattingTests: XCTestCase {
  weak var titlelabel: UILabel!
  weak var textview: UITextView!
  weak var imageplace: UIImageView!
  var APIClass: ChickenCoopAPI!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      APIClass = ChickenCoopAPI(searched: "Mock Game", platform: "Any")
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
    //    GIVEN
        let platform = "PS4"
    //    WHEN
        let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
    //    THEN
        XCTAssertEqual(formattedplatform, "playstation-4")
  }
  func testFormatPlatformStringXONE() {
    //    GIVEN
        let platform = "XONE"
    //    WHEN
        let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
    //    THEN
        XCTAssertEqual(formattedplatform, "xbox-one")
  }
  func testFormatPlatformStringSTADIA() {
    //    GIVEN
           let platform = "Stadia"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "stadia")
  }
  func testFormatPlatformStringSWITCH() {
    //    GIVEN
           let platform = "Switch"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "switch")
  }
  func testFormatPlatformString3DS() {
    //    GIVEN
           let platform = "3DS"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "3ds")
  }
  func testFormatPlatformStringX360() {
    //    GIVEN
           let platform = "X360"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "xbox360")
  }
  func testFormatPlatformStringWIIU() {
    //    GIVEN
           let platform = "WIIU"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "wii-u")
  }
  func testFormatPlatformStringVITA() {
    //    GIVEN
           let platform = "VITA"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "playstation-vita")
  }
  func testFormatPlatformStringPSP() {
    //    GIVEN
           let platform = "PSP"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "psp")
  }
  func testFormatPlatformStringGBA() {
    //    GIVEN
           let platform = "GBA"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "game-boy-advance")
  }
  func testFormatPlatformStringPS2() {
    //    GIVEN
           let platform = "PS2"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "playstation-2")
  }
  func testFormatPlatformStringPS3() {
    //    GIVEN
           let platform = "PS3"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "playstation-3")
  }
  func testFormatPlatformStringDS() {
    //    GIVEN
           let platform = "DS"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "ds")
  }
  func testFormatPlatformStringIOS() {
    //    GIVEN
           let platform = "iOS"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "ios")
  }
  func testFormatPlatformStringDEFAULT() {
    //    GIVEN
           let platform = "Any"
       //    WHEN
           let formattedplatform = APIClass.formatplatformstring(stringtoformat: platform)
       //    THEN
           XCTAssertEqual(formattedplatform, "Any")
  }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      titlelabel = nil
      textview = nil
      imageplace = nil
      APIClass = nil
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
    }

}
