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
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!) * 30,
                                                     CGFloat((data?.acceleration.y)!) * 30)
            print("X: \((data?.acceleration.x)!)")
            print("Y: \((data?.acceleration.y)!)")
            
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
