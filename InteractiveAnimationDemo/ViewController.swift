//
//  ViewController.swift
//  InteractiveAnimationDemo
//
//  Created by Chan Jing Hong on 13/11/2017.
//  Copyright © 2017 Cocoacode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animator: UIViewPropertyAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()

        let square = UIView(frame: CGRect(x: 10, y: self.view.bounds.height/2 - 50, width: 100, height: 100))
        square.backgroundColor = .brown
        self.view.addSubview(square)

        let timing = UICubicTimingParameters(animationCurve: .easeOut)
        animator = UIViewPropertyAnimator(duration: 2.0, timingParameters:timing)
        animator.addAnimations {
            square.center = CGPoint(x: 300, y: square.center.y)
            square.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.view.addGestureRecognizer(panGesture)
    }

    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: self.view)

        // To figure out the fraction completed, take the x location of the touch,
        // and divide it by the maximum x the finger can move to (which is the screen's width)
        let fractionCompleted = location.x / self.view.bounds.width

        // Changing this property changes the % complete of the animation.
        // Try experimenting with a different fraction and see what you get
        animator.fractionComplete = fractionCompleted
    }

}

