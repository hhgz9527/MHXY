//
//  Direction.swift
//  Menghuan
//
//  Created by Jian Zhang on 5/24/15.
//  Copyright (c) 2015 Steve (Zhang Jian). All rights reserved.
//

import Foundation

enum Direction {
  case UP
  case DOWN
  case LEFT
  case RIGHT
}

extension Direction {
  
  static func directionFrom(point: CGPoint, toOirgin: CGPoint) -> Direction {
    let angle = point.angleWith(toOirgin)
    return directionFrom(angle)
  }
  
  static func directionFrom(angle: CGFloat) -> Direction {
    if ((angle > 0 && angle < 60) || (angle > 300 && angle < 360)) {
      return .RIGHT
    }
    
    if (angle > 60 && angle < 120) {
      return .UP
    }
    
    if (angle > 120 && angle < 240) {
      return .LEFT
    }
    
    return .DOWN
  }
}