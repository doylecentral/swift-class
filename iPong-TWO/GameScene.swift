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

    var leftScore : Int = 0
    var rightScore : Int = 0
    
    var ball: SKShapeNode?//(circleOfRadius: 40)
    //TODO: Randomize this
    var velArray : [CGFloat] = [5 , 6] //Better generic shortcut than Array<CGFloat>
    let radius : CGFloat = 40
    let width:CGFloat = UIScreen.mainScreen().bounds.size.width
    let height:CGFloat = UIScreen.mainScreen().bounds.size.height
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    
    var pdTopview : UIView = UIView (frame: CGRectMake(UIScreen.mainScreen().bounds.size.width - 100, 0, 100, UIScreen.mainScreen().bounds.size.height))
    
    var pdview : UIView = UIView (frame: CGRectMake(0, 0, 100, UIScreen.mainScreen().bounds.height))
    
    var leftScoreLabel : SKLabelNode?
    var rightScoreLabel : SKLabelNode?
    
    var leftScoreBox : SKShapeNode = SKShapeNode(rect:  CGRectMake(200,
        (UIScreen.mainScreen().bounds.size.height / 2) - 100, 200, 200))
    var rightScoreBox : SKShapeNode = SKShapeNode(rect:  CGRectMake(600,
        (UIScreen.mainScreen().bounds.size.height / 2) - 100, 200, 200))
    
    
    func handlePan(sender: UIPanGestureRecognizer ){
        var sndrView = sender.view
        var move = sender.locationInView(sndrView).y
        //Fun times
        var dist : CGFloat = (((height - 150) - (move)))
        
        if (sndrView == pdview){
            paddle?.position.y = dist
        }else{
            paddle2?.position.y = dist
        }
        
        //Does-ith Crash-ith thy app
        //println("Location of Das Touch \(sender.locationOfTouch(0, inView: self.view))")
        
        //Vel
        //println("Velocity \(sender.velocityInView(sndrView))")
        
    }
    
    //Need to refactor this
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        myLabel.text = "Start";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
        
        velArray[0] = randomCGFloat()
        velArray[1] = randomCGFloat()
        
        //Setup some elments
        addScoreBoxes()
        addPaddle()
        
    }
    
    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random_uniform(9)) + 3
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        myLabel.hidden = true
        //Add this to it's own gesture reconizer nxt refactor
        
        addBall()
        
        
    }
    
    func addScoreBoxes(){
        leftScoreBox.fillColor = SKColor.yellowColor()
        leftScoreLabel = SKLabelNode(text: leftScore.description)
        leftScoreLabel?.position = CGPointMake(300, 300)
        leftScoreLabel?.zPosition = 1
        leftScoreLabel?.fontColor = SKColor.blackColor()
        leftScoreLabel?.fontSize = 40
        leftScoreLabel?.fontName = "Chalkduster"

        leftScoreBox.addChild(leftScoreLabel!)
        
        self.addChild(leftScoreBox)

        rightScoreBox.fillColor = SKColor.yellowColor()
        rightScoreLabel = SKLabelNode(text: rightScore.description)
        rightScoreLabel?.position = CGPointMake(700, 300)
        rightScoreLabel?.zPosition = 1
        rightScoreLabel?.fontColor = SKColor.blackColor()
        rightScoreLabel?.fontSize = 40
        rightScoreLabel?.fontName = "Chalkduster"
        
        rightScoreBox.addChild(rightScoreLabel!)
        
        self.addChild(rightScoreBox)
    }
    
    
    func addPaddle(){
        if (paddle == nil) {
            
            pdview.backgroundColor = SKColor.redColor()
            pdTopview.backgroundColor = SKColor.purpleColor()
            
            paddle = SKShapeNode(rect: CGRectMake(101, 10, 10, 300))
            paddle?.fillColor = SKColor.blueColor()
            
            paddle2 = SKShapeNode(rect: CGRectMake(width - 111, 10, 10, 300))
            paddle2?.fillColor = SKColor.blueColor()
            
            var panRecognizer = UIPanGestureRecognizer(target: self ,action: "handlePan:")
            var panRecognizer2 = UIPanGestureRecognizer(target: self, action: "handlePan:")
            
            pdview.addGestureRecognizer(panRecognizer)
            pdTopview.addGestureRecognizer(panRecognizer2)
            
            self.view?.addSubview(pdview)
            self.view?.addSubview(pdTopview)
            
            self.addChild(paddle2!)
            self.addChild(paddle!)
        }
        
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        if (ball != nil) {
            
            var left: CGPoint = CGPointMake(ball!.position.x - radius, ball!.position.y )
            var right: CGPoint = CGPointMake(ball!.position.x + radius, ball!.position.y)
            
            var hitPaddle = paddle!.containsPoint(left)
            var hitPaddle2 = paddle2!.containsPoint(right)
            
            if(hitPaddle || hitPaddle2){
                velArray[0] = -velArray[0]
            }

        
            ball?.position.x += velArray[0]
            ball?.position.y += velArray[1]
            
            if(ball?.position.x >= (width - radius) || ball?.position.x <= radius ){
                velArray[0] = -velArray[0]
                
                if(velArray[0] > 0){
                    println("Score Right \(velArray[0])")
                    rightScore++
                    rightScoreLabel?.text = rightScore.description
                    //respawn to the left
                }else{
                    println("Score Left \(velArray[0])")
                    leftScore++
                    leftScoreLabel?.text = leftScore.description
                    //respawn to the right
                }
            }
            
            if(ball?.position.y >= (height - radius) || ball?.position.y <= radius ){
                velArray[1] = -velArray[1]
                
                println("Hit Y \(velArray[1])")
            }
            
        }
    }
    
    
    func addBall(){
        if (ball == nil) {
            ball = SKShapeNode(circleOfRadius: 40)
            ball?.position = CGPointMake(500, 500)
            ball?.name = "defaultCircle"
            ball?.strokeColor = SKColor.blackColor()
            ball?.fillColor = SKColor.grayColor()
            ball?.zPosition = 2
            self.addChild(ball!)
        }
        
    }
}
