//
//  GameScene.swift
//  Maze
//
//  Created by Flatiron School on 7/8/16.
//  Copyright (c) 2016 Flatiron School. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    let manager = CMMotionManager()
    
    override func didMoveToView(view: SKView) {
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.5
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) {
            (data, error) in
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!) * 10,
                                                     CGFloat((data?.acceleration.y)!) * 10)
            
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
