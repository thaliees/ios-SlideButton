//
//  ViewController.swift
//  SlideButton
//
//  Created by Thaliees on 6/14/19.
//  Copyright © 2019 Thaliees. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var areaView: UIView!
    @IBOutlet weak var toSlider: UILabel!
    @IBOutlet weak var text: UILabel!
    
    private let trailingView:CGFloat = 40, leadingView:CGFloat = 40 // Trailing and Leading of Autolayout
    private let widthScreen = UIScreen.main.bounds.width
    private var initX:CGFloat = 0.0, limitX:CGFloat = 0.0, widthInitToSlider:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        widthInitToSlider = toSlider.frame.width
    }

    @IBAction func handleOnTouch(_ sender: UIPanGestureRecognizer) {
        let toSlide:UILabel = sender.view as! UILabel
        let traslation = sender.translation(in: toSlider)
        if limitX == 0 {
            initX = toSlide.center.x
            limitX = widthScreen - (trailingView + leadingView + (widthInitToSlider / 2))
        }
        
        if sender.state == .changed {
            // Move the button
            if toSlide.center.x > (initX - traslation.x) {
                toSlide.center.x = toSlide.center.x + traslation.x
            }
            // Move to the end and avoid overflowing the limit
            if toSlide.center.x >= limitX {
                toSlide.center.x = limitX
            }
            // Move to the start and avoid overflowing the limit
            if toSlide.center.x < initX - traslation.x {
                toSlide.center.x = initX
            }
        }
        else if sender.state == .ended {
            // What message show?
            if toSlide.center.x == initX {
                text.text = "Hello World"
            }
            else if toSlide.center.x == limitX {
                text.text = "Welcome"
            }
            else{
                text.text = "Continue sliding"
            }
        }
        sender.setTranslation(CGPoint.zero, in: toSlider)
    }
    
}

