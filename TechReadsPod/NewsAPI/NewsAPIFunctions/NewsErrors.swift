//
//  NewsErrors.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/04/20.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

public enum NewsInfoError: Error {
  case noDataAvailable(String)
  case canNotProcessData(String)
}
