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
    static let All       : UInt32 = UInt32.max
    static let Monster   : UInt32 = 0b1       // 1
    static let Projectile: UInt32 = 0b10      // 2
}

class GameScene: SKScene , SKPhysicsContactDelegate{
    
   



    let velocity: CGFloat = 3
    let radius : CGFloat = 40
    
    override func didMoveToView(view: SKView) {
//       self.physicsBody = SKPhysicsBody(ed: self.frame)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: UIScreen.mainScreen().bounds)
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
        
        //physicsWorld.gravity = CGVectorMake(0, 0)
        //physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        addBall()
        
//        
//        for touch: AnyObject in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
        
        for touch: AnyObject in touches {
            println("Touch?")
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        //moveBall()

    }
    
    func moveBall(){
        /*
        Need to move this
        */
        var bounds: CGRect = UIScreen.mainScreen().bounds
        var width:CGFloat = bounds.size.width
        var height:CGFloat = bounds.size.height
        
        
        // (ball_pos[1] <= BALL_RADIUS) or (ball_pos[1] >= HEIGHT - BALL_RADIUS):
        //#then flip the direction of the y vector
        //ball_vel[1] = -ball_vel[1]
/*
        
        if(circle.position.x >= (width - radius)){
            println("FLIP:")
            circle.position.x = circle.position.x - velocity
        }else{
            circle.position.x = circle.position.x + velocity //CGPointMake( circle.position.x + velocity , circle.position.y)
        }
  */
//
//        if(circle.position.x <= (width - radius))
//        {
//            
//            circle.position = CGPointMake(circle.position.x + velocity , circle.position.y)
//        }
  //      println("Circle Position: \(circle.position)")
        
    }
    
    func addBall(){
        var circle = SKShapeNode(circleOfRadius: 40)
        //var circle = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(10, 10))
        
        circle.position = CGPointMake(500, 500)
        circle.name = "defaultCircle"
        circle.strokeColor = SKColor.blackColor()
        circle.fillColor = SKColor.whiteColor()
        circle.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(radius))
        circle.physicsBody?.dynamic = true
        circle.physicsBody?.friction = 0
        circle.physicsBody?.linearDamping = 0
        circle.physicsBody?.restitution = 1.0
        circle.physicsBody?.allowsRotation = false
        circle.physicsBody?.applyImpulse(CGVectorMake(10, -10))
        
        self.addChild(circle)
        
    }
    
    /*
    func addBall() {
        
        // Create sprite
        let monster = SKSpriteNode(imageNamed: "monster")
        
        
        // Determine where to spawn the monster along the Y axis
        let actualY = random(min: monster.size.height/2, max: size.height - monster.size.height/2)
        
        // Position the monster slightly off-screen along the right edge,
        // and along a random position along the Y axis as calculated above
        monster.position = CGPoint(x: size.width + monster.size.width/2, y: actualY)
        
        // Add the monster to the scene
        addChild(monster)
        
        // Determine speed of the monster
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: -monster.size.width/2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
*/
}
