//
//  GameScene.swift
//  iPong-TWO
//
//  Created by Doyle on 2/5/15.
//  Copyright (c) 2015 Doyle Widget Factory. All rights reserved.
//

import SpriteKit

class GameScene: SKScene{
    
    //Refactor for factory ??
    var paddle: SKShapeNode? //rect: CGRectMake(10, 10, 10, 10))
    var paddle2: SKShapeNode? //rect: CGRectMake(10, 10, 10, 10))
    
    var circle: SKShapeNode?//(circleOfRadius: 40)
    //TODO: Randomize this
    var velArray : [CGFloat] = [5 , 4] //Better generic shortcut than Array<CGFloat>
    let radius : CGFloat = 40
    let width:CGFloat = UIScreen.mainScreen().bounds.size.width
    let height:CGFloat = UIScreen.mainScreen().bounds.size.height
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    

    
    func handlePan(sender: UIPanGestureRecognizer ){
        var sndrView = sender.view
        
        println("Moving \(sender.locationInView(sndrView).y)")
        
        //Does-ith Crash-ith thy app
        //println("Location of Das Touch \(sender.locationOfTouch(0, inView: self.view))")
        println("Velocity \(sender.velocityInView(sndrView))")
        
        var move = sender.locationInView(sndrView).y
        //Fun times
        var dist : CGFloat = (((height - 150) - (move)))
        
        println("Distance: \(dist)")
        paddle?.position.y = dist
        
    }

    
    func handlePanTop(sender: UIPanGestureRecognizer ){
        var sndrView = sender.view
        
        println("Moving \(sender.locationInView(sndrView).y)")
        
        //Does-ith Crash-ith thy app
        //println("Location of Das Touch \(sender.locationOfTouch(0, inView: self.view))")
        println("Velocity \(sender.velocityInView(sndrView))")
        
        var move = sender.locationInView(sndrView).y
        //Fun times
        var dist : CGFloat = (((height - 150) - (move)))
        
        println("Distance: \(dist)")
        paddle2?.position.y = dist
        
    }

    
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
        addPaddle()
        addBall()
        
    }
    
    
    func addPaddle(){
        if (paddle == nil) {
            
            var pdview : UIView = UIView (frame: CGRectMake(0, 0, 100, UIScreen.mainScreen().bounds.height))
            var pdTopview : UIView = UIView (frame: CGRectMake(width - 100, 0, 100, height))
            
            
            pdview.backgroundColor = SKColor.redColor()
            pdTopview.backgroundColor = SKColor.purpleColor()
            
            paddle = SKShapeNode(rect: CGRectMake(101, 10, 10, 300))
            paddle?.fillColor = SKColor.blueColor()
            
            paddle2 = SKShapeNode(rect: CGRectMake(width - 111, 10, 10, 300))
            paddle2?.fillColor = SKColor.blueColor()
            
            var swipeRecognizer = UIPanGestureRecognizer(target: self ,action: "handlePan:")
            var swipeRecognizer2 = UIPanGestureRecognizer(target: self, action: "handlePanTop:")
            
            pdview.addGestureRecognizer(swipeRecognizer)
            pdTopview.addGestureRecognizer(swipeRecognizer2)
            
            self.view?.addSubview(pdview)
            self.view?.addSubview(pdTopview)

            self.addChild(paddle2!)
            self.addChild(paddle!)
        }

        
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
