//
//  Player.swift
//  Menghuan
//
//  Created by Jian Zhang on 5/23/15.
//  Copyright (c) 2015 Steve (Zhang Jian). All rights reserved.
//

import SpriteKit
import SwiftyJSON

protocol Player {
  var animation: PlayerWalkAnimation? {
    set
    get
  }
  
  func idle()
  func walkUp()
  func walkRight()
  func walkDown()
  func walkLeft()
}

class PlayerImpl: SKSpriteNode, Player {
  var animation: PlayerWalkAnimation?
  
  // MARK: lifecycle
  
  init (json: JSON) {
    let texture = SKTexture(imageNamed: json["idle"].stringValue)
    super.init(texture: texture, color: NSColor.clearColor(), size: texture.size())
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder);
  }
  
  // MARK: public
  
  func idle() {
    walkUp()
  }
  
  func walkUp() {
    if let animation = animation {
      runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(animation.walkUpAnimation(), timePerFrame: 0.1)))
    }
  }
  
  func walkRight() {
    if let animation = animation {
      runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(animation.walkRightAnimation(), timePerFrame: 0.1)))
    }
  }
  
  func walkDown() {
    if let animation = animation {
      runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(animation.walkDownAnimation(), timePerFrame: 0.1)))
    }
  }
  
  func walkLeft() {
    if let animation = animation {
      runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(animation.walkLeftAnimation(), timePerFrame: 0.1)))
    }
  }
}