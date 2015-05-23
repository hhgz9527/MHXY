//
//  GameScene.swift
//  Menghuan
//
//  Created by Jian Zhang on 5/22/15.
//  Copyright (c) 2015 Steve (Zhang Jian). All rights reserved.
//

import SpriteKit
import SwiftyJSON

class GameScene: SKScene {
  var player: Player?
  
  override init() {
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func didMoveToView(view: SKView) {
    var playerData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("Butterfly", ofType: "json")!)
    
    // background
    let background = SKSpriteNode(imageNamed: "MAPEastSea")
    background.position = CGPointMake(400, 400)
    addChild(background)
    
    // player
    if let jsonData = playerData {
      self.player = PlayerImpl(json: JSON(data: jsonData))
      self.player?.animation = PlayerAnimationImpl(json: JSON(data: jsonData))
      (self.player as! SKSpriteNode).position = CGPointMake(300, 300)
      self.addChild(self.player as! SKSpriteNode)
      self.player?.idle()
    }
  }
  
  override func mouseDown(theEvent: NSEvent) {
    let mouseLocation = theEvent.locationInNode(self)
    let direction = Direction.directionFrom(mouseLocation, toOirgin: (self.player as! SKSpriteNode).position)
    
    if (direction == .UP) {
      self.player?.walkUp()
    }
    
    if (direction == .LEFT) {
      self.player?.walkLeft()
    }
    
    if (direction == .RIGHT) {
      self.player?.walkRight()
    }
    
    if (direction == .DOWN) {
      self.player?.walkDown()
    }
    
    (self.player as! SKSpriteNode).runAction(SKAction.moveTo(mouseLocation, duration: (self.player as! SKSpriteNode).position.moveTimeTo(mouseLocation)))
  }
  
  
  
  override func update(currentTime: CFTimeInterval) {
  }
}
