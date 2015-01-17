//
//  GameScene.swift
//  SpriteTower
//
//  Created by 刁培倫 on 2014/9/16.
//  Copyright (c) 2014年 klandor. All rights reserved.
//

import SpriteKit

extension Int{
    func inRange(min:Int, max:Int) -> Int{
        if self < min
        {
            return min
        }
        else if self > max
        {
            return max
        }
        else
        {
            return self
        }
    }
}

class GameScene: SKScene {
    let types: [String] = ["Rectangle","Circle","Polygon","Triangle"]
    var currentTouch: UITouch? = nil
    var previousIndex: (x:Int, y:Int) = (-1,-1)
    var jewels: [[SKSpriteNode]] = []
    
    override func didMoveToView(view: SKView) {
        for i in 0..<6
        {
            jewels.append([])
            for j in 0..<5
            {
                let typeIndex = arc4random_uniform(4)
                let type = types[Int(typeIndex)]
                let jewel = SKSpriteNode(imageNamed:type)
                jewel.anchorPoint = CGPoint(x: 0, y: 0)
                jewel.position = CGPoint(x: i*200, y: j*200)
                self.addChild(jewel)
                
                jewels[i].append(jewel)
            }
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        

        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
//            let location = touch.locationInNode(self)
//            
//            let x = Int(location.x / 200), y = Int(location.y / 200)
//            NSLog("(x,y) = (\(x),\(y))")
        }
        
//        var helloNode: SKNode! = self.childNodeWithName("helloNode")
//        if (helloNode != nil)
//        {
//            helloNode.name = nil;
//            var moveUp = SKAction.moveByX(0, y: 100.0, duration: 0.5)
//            let zoom = SKAction.scaleTo(2.0, duration: 0.25)
//            let pause = SKAction.waitForDuration(0.5)
//            let fadeAway = SKAction.fadeOutWithDuration(0.25)
//            let remove = SKAction.removeFromParent()
//            let moveSequence = SKAction.sequence([moveUp, zoom, pause, fadeAway, remove])
//            helloNode.runAction(moveSequence)
//        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        //NSLog("touch moved count: \(touches.count), event: \(event)")
        
        var inNode = false;
        for touch: AnyObject in touches {
            let index = getIndexes(touch as UITouch)
            
            if index.x != index.px || index.y != index.py
            {
                switchJewel(index)
            }
        }
    }
    
    func switchJewel(index:(x:Int, y:Int, px:Int, py:Int))
    {
        let duration = 0.1
        let direction = (x:index.x - index.px, y:index.y - index.py)
        let a1 = SKAction.moveByX(CGFloat(direction.x * 200), y: CGFloat(direction.y * 200), duration: duration)
        let a2 = SKAction.moveByX(CGFloat(-direction.x * 200), y: CGFloat(-direction.y * 200), duration: duration)
        
        jewels[index.px][index.py].runAction(a1)
        jewels[index.x][index.y].runAction(a2)
        
        let tmp = jewels[index.x][index.y]
        jewels[index.x][index.y] = jewels[index.px][index.py]
        jewels[index.px][index.py] = tmp
    }
    
    func getIndexes(touch: UITouch) -> (x:Int, y:Int,px:Int, py:Int)
    {
        let previousLocation = touch.previousLocationInNode(self)
        let location = touch.locationInNode(self)
        
        let x = Int(location.x / 200).inRange(0, max: 5)
        let y = Int(location.y / 200).inRange(0, max: 4)
        let px = Int(previousLocation.x / 200).inRange(0, max: 5)
        let py = Int(previousLocation.y / 200).inRange(0, max: 4)
        return (x,y,px,py)
    }
    

   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}