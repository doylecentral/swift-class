//
//  GameScene.swift
//  iPong-TWO
//
//  Created by Doyle on 2/5/15.
//  Copyright (c) 2015 Doyle Widget Factory. All rights reserved.
//

import SpriteKit

class GameScene: SKScene{
    
    var circle: SKShapeNode?//(circleOfRadius: 40)
    //TODO: Randomize this
    var velArray : [CGFloat] = [5 , 4] //Better generic shortcut than Array<CGFloat>
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
                
        velArray[0] = randomCGFloat()
        velArray[1] = randomCGFloat()

    }

    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random_uniform(5)) + 1
    }


    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        myLabel.hidden = true
        //Add this to it's own gesture reconizer nxt refactor
        addBall()
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        if (circle != nil) {

            circle?.position.x += velArray[0]
            circle?.position.y += velArray[1]
        
            if(circle?.position.x >= (width - radius) || circle?.position.x <= radius ){
                velArray[0] = -velArray[0]
            }
        
            if(circle?.position.y >= (height - radius) || circle?.position.y <= radius ){
                velArray[1] = -velArray[1]
            }
        }
    }
    
    
    func addBall(){
        if (circle == nil) {
            circle = SKShapeNode(circleOfRadius: 40)
            circle?.position = CGPointMake(500, 500)
            circle?.name = "defaultCircle"
            circle?.strokeColor = SKColor.blackColor()
            circle?.fillColor = SKColor.grayColor()
            self.addChild(circle!)
        }
        
    }
    }
