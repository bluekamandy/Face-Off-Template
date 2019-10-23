//  WorkSpace.swift
//
//  Face-Off Template for iPhone or iPad
//  Creative Coding for Mobile Devices
//  Assignment Inspired by Bruno Munari, Lorenzo Bravi, and Casey Reas
//
//  by MASOOD
//  © 2019 All Rights Reserved


import UIKit
import C4

class WorkSpace: UpdateCanvasController {
    
    // Declare your shapes here globally.
    
    var circle:Circle!
    
    var v: Double! // Raw volume from mic
    var easev = 0.0 // For easing. Needs to start out at 0.
    
    var easing = 0.1 // The closer to 0 the smoother your animation. Closer to 1 the faster/harsher s the animation.
    
    // MARK: - Setup runs once
    
    override func setup() {
        
        // Initialize your shapes here and add to canvas.
        
        circle = Circle(center: canvas.center, radius: 100)
        circle.fillColor = clear
        circle.strokeColor = white
        
        canvas.add(circle)
        
    }
    
    // MARK: - Draw runs 60 frames per second
    
    override func draw() {
        
        MicInput.shared.updateMeter()
        
        v = map(valueToModify: MicInput.shared.myVolume, low1: 25, high1: 75, low2: 0, high2: 5)
        easev += (v - easev) * easing // Easing Algorithm
        
        // Modify your shape sizes and positions here

        let scale = Transform.makeScale(easev, easev)
        circle.transform = scale
        
        print(v)
        

    }
    
}

