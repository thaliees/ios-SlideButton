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
    @IBOutlet weak var toSlider: UIImageView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var reset: UIButton!
    
    private let trailingView:CGFloat = 40, leadingView:CGFloat = 40 // Trailing and Leading of Autolayout
    private let widthScreen = UIScreen.main.bounds.width            // Width of the screen of device
    private var initX:CGFloat = 0.0, limitX:CGFloat = 0.0, widthInitToSlider:CGFloat = 0.0, percentage:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        widthInitToSlider = toSlider.frame.width                    // Width of ouw UILabel
        // Shaped round
        areaView.layer.cornerRadius = CGFloat(20)
        areaView.clipsToBounds = true
        toSlider.layer.cornerRadius = CGFloat(20)
        toSlider.clipsToBounds = true
    }

    @IBAction func handleOnTouch(_ sender: UIPanGestureRecognizer) {
        let toSlide:UIImageView = sender.view as! UIImageView
        let traslation = sender.translation(in: toSlider)
        if limitX == 0 {
            initX = toSlide.center.x
            limitX = widthScreen - (trailingView + leadingView + (widthInitToSlider / 2))
            percentage = (limitX * 0.25)        // Calculate 75%
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
            print(toSlider.center.x)
            // What animation to do?
            // If the position of the movement exceeds 75% of the width of the limitX, expand
            if toSlide.center.x > limitX - percentage {
                self.expandedButton()
            }
            else{
                self.moveButtonBack()
            }
        }
        sender.setTranslation(CGPoint.zero, in: toSlider)
    }
    
    @IBAction func resetButtonAction(_ sender: UIButton) {
        self.text.isHidden = true
        self.reset.isEnabled = false
        self.toSlider.isUserInteractionEnabled = true
        collapseButton()
    }
    
    // MARK: Custom Functions
    private func expandedButton(){
        // Animation
        UIView.animate(withDuration: 2.0, animations: {
            // What to do?
            // Update the UIImageView
            self.toSlider.image = UIImage(named: "check")
            // Update the width of our UILabel
            self.toSlider.frame.size.width = self.areaView.frame.width
            // Update the position of our UILabel
            self.toSlider.center.x = self.areaView.center.x - self.leadingView
        }) { (completion) in
            // What to do end?
            // Cancel the User Interaction Enabled for avoid move the UILabel
            self.toSlider.isUserInteractionEnabled = false
            // Show message
            self.text.isHidden = false
            // Activate Button
            self.reset.isEnabled = true
        }
    }
    
    private func moveButtonBack(){
        // Animation
        UIView.animate(withDuration: 2.0) {
            // Update the position of our UILabel
            self.toSlider.center.x = self.initX
        }
    }
    
    private func collapseButton(){
        // Animation
        UIView.animate(withDuration: 1.0) {
            // What to do?
            // Update the UIImageView
            self.toSlider.image = UIImage(named: "arrow")
            // Update the width of our UILabel
            self.toSlider.frame.size.width = self.widthInitToSlider
            // Update the position of our UILabel
            self.toSlider.center.x = self.initX
        }
    }
}

