//
//  TowerEngine.swift
//  SpriteTower
//
//  Created by 刁培倫 on 2014/11/19.
//  Copyright (c) 2014年 klandor. All rights reserved.
//

import Foundation

enum Shape: Int{
    case Rectangle = 0, Circle, Ploygon, Triangle
}

class Jewel
{
    var shape: Shape
    
    init()
    {
        shape = Shape.Rectangle
    }
}

class TowerEngine {
    var jewelArray:[[Jewel]] = []
    
    init()
    {
        for i in 0..<6
        {
            jewelArray.append([])
            for j in 0..<5
            {
                jewelArray[i].append(Jewel())
            }
        }
    }
    
    func randomJewels()
    {
        for a in jewelArray
        {
            for j in a
            {
                j.shape = Shape(rawValue: Int(arc4random_uniform(4)))!
            }
        }
    }
}