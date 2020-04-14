//
//  PreferencesManagement.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/02/26.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

public class SaveClass {
   public let file = "UserMedium.txt" //this is the name of the file for the user medium

   public func loadMedium() -> String {
         var consolepref = ""
         let utillities = SavingUtilities.init()
         consolepref = utillities.loadMedium()
     return consolepref
   }
 //  the following function is to save the console preference to a file
   public func savingMedium(medium: String) {
     if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
       let fileurl = dir.appendingPathComponent(file)
       do {
        try medium.write(to: fileurl, atomically: false, encoding: .utf8)
       } catch {
         print(error)
       }
     }
   }
}

@objc public class PreferenceUtilities: NSObject {
  //  the following function is to save the console preference to a file
  @objc public func saveMedium(savingPref: String) {
    let savFunc = SaveClass()
    savFunc.savingMedium(medium: savingPref)
  }

}
