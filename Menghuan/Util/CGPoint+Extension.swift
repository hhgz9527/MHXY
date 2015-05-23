//
//  CGPoint+Extension.swift
//  Menghuan
//
//  Created by Jian Zhang on 5/24/15.
//  Copyright (c) 2015 Steve (Zhang Jian). All rights reserved.
//

import Foundation

extension CGPoint {
  func angleWith(origin: CGPoint) -> CGFloat {
    let p = CGPoint(x: self.x - origin.x, y: self.y - origin.y)
    var angle = asin(p.y / sqrt((pow(p.x, CGFloat(2)) + pow(p.y, CGFloat(2))))) / CGFloat(M_PI) * 180
    if angle >= 0 {
      if (p.x < 0) {
        angle = 180 - angle;
      }
    } else {
      angle = 360 + angle;
      
      if (p.x < 0) {
        angle = 3 * 90 * 2 - angle
      }
    }
    return angle
  }
  
  func moveTimeTo(point: CGPoint) -> NSTimeInterval {
    let p = CGPoint(x: self.x - point.x, y: self.y - point.y)
    var distance = sqrt((pow(p.x, CGFloat(2)) + pow(p.y, CGFloat(2))))
    return NSTimeInterval(distance / 100)
  }
}