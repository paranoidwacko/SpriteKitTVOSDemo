//
//  GameScene.swift
//  TestTvOSSpriteKit
//
//  Created by JH on 6/21/17.
//  Copyright © 2017 Sparrowhawk. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?

    var player: SKSpriteNode?
    var playerColor = UIColor.orange
    var playerSize = CGSize(width: 60, height: 60)
    var offBlackColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
    
    func spawnPlayer() {
        player = SKSpriteNode(color: playerColor, size: playerSize)
        player?.size = playerSize
        player?.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        if let player = player {
            self.addChild(player)
        }
    }
    
    override func didMove(to view: SKView) {
        spawnPlayer()
        playerActions()
        self.backgroundColor = offBlackColor
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            movePlayerToTouch(location: location)
        }
    }
    
    func movePlayerToTouch(location: CGPoint) {
        player?.position = location
    }
  
    func playerActions() {
        let wait = SKAction.wait(forDuration: 2.0)
        let moveTo = SKAction.moveTo(x: 250, duration: 0.5)
        let fadeOut = SKAction.fadeOut(withDuration: 1.0)
        let fadeIn = SKAction.fadeIn(withDuration: 1.0)
        let sequence = SKAction.sequence([wait, moveTo, fadeOut, wait, fadeIn])
        player?.run(SKAction.repeat(sequence, count: 1))
    }
    
    
}
