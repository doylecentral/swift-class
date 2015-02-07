//
//  GameScene.swift
//  iPong-TWO
//
//  Created by Doyle on 2/5/15.
//  Copyright (c) 2015 Doyle Widget Factory. All rights reserved.
//

import SpriteKit


struct PhysicsCategory {
    static let None      : UInt32 = 0
    //    static let All       : UInt32 = UInt32.max
    //    static let Monster   : UInt32 = 0b1       // 1
    //    static let Projectile: UInt32 = 0b10      // 2
}

class GameScene: SKScene , SKPhysicsContactDelegate{
    
    
    func setPhysics(){
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: UIScreen.mainScreen().bounds)
        self.physicsBody?.friction = 0
        //self.physicsWorld.gravity.dy = 0.0
        //self.physicsWorld.gravity.dx = 0.0
//                 self.physicsWorld.gravity = CGVectorMake(0.0, 0)
        self.backgroundColor = UIColor.blackColor()
        println("Yes Was Called")
        
        var ball = addBall()
        ball.physicsBody?.applyImpulse(CGVectorMake(0, 10))
        self.addChild(ball)
        
    }
    
    
    override func didMoveToView(view: SKView) {
        
        /*
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
        */
        
        physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //Just leaving it in here
        for touch: AnyObject in touches {
            println("Touch?")
        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        //moveBall()
        
    }
    
    
    func  addBall() -> SKShapeNode{
        var circle = SKShapeNode(circleOfRadius: 40)
        //var circle = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(10, 10))
        
        circle.position = CGPointMake(500, 500)
        circle.name = "defaultCircle"
        circle.strokeColor = SKColor.blackColor()
        circle.fillColor = SKColor.whiteColor()
        circle.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(40))
        circle.physicsBody?.dynamic = true
        circle.physicsBody?.friction = 0.0
        circle.physicsBody?.affectedByGravity = true
        circle.physicsBody?.linearDamping = 0.0
        circle.physicsBody?.restitution = 1.0
//        circle.physicsBody?.mass = 0.0
        
        circle.physicsBody?.allowsRotation = false
        //        circle.physicsBody?.applyImpulse(CGVectorMake(10, -10), atPoint: CGPointMake(200, 300))
        return circle
    }
}
