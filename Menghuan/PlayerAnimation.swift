//
//  PlayerAnimation.swift
//  Menghuan
//
//  Created by Jian Zhang on 5/23/15.
//  Copyright (c) 2015 Steve (Zhang Jian). All rights reserved.
//

import SpriteKit
import SwiftyJSON

protocol PlayerWalkAnimation {
  func walkUpAnimation() -> [SKTexture]
  func walkRightAnimation() -> [SKTexture]
  func walkDownAnimation() -> [SKTexture]
  func walkLeftAnimation() -> [SKTexture]
}

class PlayerAnimationImpl: NSObject, PlayerWalkAnimation {
  private var json: JSON
  
  private var walkUpTextures, walkRightTextures, walkDownTextures, walkLeftTextures: [SKTexture]?
  
  // MARK: lifecycle
  
  init(json: JSON) {
    self.json = json
  }
  
  // MARK: public
  
  func walkUpAnimation() -> [SKTexture] {
    if let walkUpTextures = self.walkUpTextures {
      return walkUpTextures
    }
    
    self.walkUpTextures = self.loadWalkTextures("up")
    
    return self.walkUpTextures!
  }
  
  func walkRightAnimation() -> [SKTexture] {
    if let walkRightTextures = self.walkRightTextures {
      return walkRightTextures
    }
    
    self.walkRightTextures = self.loadWalkTextures("right")
    
    return self.walkRightTextures!
  }
  
  func walkDownAnimation() -> [SKTexture] {
    if let walkDownTextures = self.walkDownTextures {
      return walkDownTextures
    }
    
    self.walkDownTextures = self.loadWalkTextures("down")
    
    return self.walkDownTextures!
  }
  
  func walkLeftAnimation() -> [SKTexture] {
    if let walkLeftTextures = self.walkLeftTextures {
      return walkLeftTextures
    }
    
    self.walkLeftTextures = self.loadWalkTextures("left")
    
    return self.walkLeftTextures!
  }
  
  // MARK: private
  
  private func loadWalkTextures(direction: String) -> [SKTexture] {
    return self.json["walk"][direction].arrayValue.map{item -> SKTexture in
      return SKTexture(imageNamed: item.stringValue)
    }
  }
}
