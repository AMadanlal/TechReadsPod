//
//  GameErrors.swift
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/04/21.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

public enum GameInfoError: Error {
  case noDataAvailable(String)
  case canNotProcessData(String)
}
