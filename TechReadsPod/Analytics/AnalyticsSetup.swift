//
//  AnalyticsSetup.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/03/27.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
import FirebaseAnalytics
public class AnalyticsSetup {

  public func toConfigureFirebaseAPI() {
//   FirebaseApp.configure() //This must run in the main Projects AppDelegate Class
  }

  public func logEvent(title: String) {
//      The following example demonstrates how to log a recommended event to indicate a user
//      has clicked on a specific element in your app:
      Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
      AnalyticsParameterItemID: "id-\(title)",
        AnalyticsParameterItemName: title,
      AnalyticsParameterContentType: "cont"
      ])
  }

  //  To view this event in the Xcode debug console, enable Analytics debugging:
  //
  //  In Xcode, select Product > Scheme > Edit scheme...
  //  Select Run from the left menu.
  //  Select the Arguments tab.
  //  In the Arguments Passed On Launch section, add -FIRAnalyticsDebugEnabled.

  public func logCustomEvent(name: String, text: String, shareImage: String) {
//  If your application has specific needs not covered by a suggested event type, you can log your
//  own custom events as shown in this example:
  Analytics.logEvent("share_image", parameters: [
  "name": name as NSObject,
  "full_text": text as NSObject
  ])
  }

}
