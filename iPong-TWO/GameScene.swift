//
//  GameScene.swift
//  iPong-TWO
//
//  Created by Doyle on 2/5/15.
//  Copyright (c) 2015 Doyle Widget Factory. All rights reserved.
//

import SpriteKit

class GameScene: SKScene{
    
    var circle = SKShapeNode(circleOfRadius: 40)
    //TODO: Randomize this
    var velArray : Array<CGFloat> = [5 , 4]
    let radius : CGFloat = 40
    let width:CGFloat = UIScreen.mainScreen().bounds.size.width
    let height:CGFloat = UIScreen.mainScreen().bounds.size.height
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        

        myLabel.text = "Start";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        myLabel.hidden = true
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
        //
        //        for touch: AnyObject in touches {
        //            println("Touch?")
        //        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {

        circle.position.x += velArray[0]
        circle.position.y += velArray[1]
        
        if(circle.position.x >= (width - radius) || circle.position.x <= radius ){
            velArray[0] = -velArray[0]
        }
        
        if(circle.position.y >= (height - radius) || circle.position.y <= radius ){
            velArray[1] = -velArray[1]
        }
    }
    
    
    func addBall(){
        circle.position = CGPointMake(500, 500)
        circle.name = "defaultCircle"
        circle.strokeColor = SKColor.blackColor()
        circle.fillColor = SKColor.whiteColor()
        self.addChild(circle)
        
    }
    }
