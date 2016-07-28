//
//  GameScene.swift
//  Maze
//
//  Created by Flatiron School on 7/8/16.
//  Copyright (c) 2016 Flatiron School. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let manager = CMMotionManager()
    var ball = SKSpriteNode()
    var vaporeon = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        ball = self.childNodeWithName("ball") as! SKSpriteNode
        vaporeon = self.childNodeWithName("vaporeon") as! SKSpriteNode
    
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.5
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) {
            (data, error) in
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!) * 30,
                                                     CGFloat((data?.acceleration.y)!) * 30)
            print("X: \((data?.acceleration.x)!)")
            print("Y: \((data?.acceleration.y)!)")
            
        }
        
    }
   
    func didBeginContact(contact: SKPhysicsContact) {
        var ball = contact.bodyA
        var vaporeon = contact.bodyB
        
        if ball.categoryBitMask == 1 && vaporeon.categoryBitMask == 2 || ball.categoryBitMask == 2 && vaporeon.categoryBitMask == 1 {
            // you won
            print("you won!")
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
