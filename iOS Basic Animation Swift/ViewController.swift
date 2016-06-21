//
//  ViewController.swift
//  iOS Basic Animation Swift
//
//  Created by xoyal on 21/06/16.
//  Copyright © 2016 xoyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let container = UIView()
    let greenContainer = UIView()
    let blueContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.container.frame = CGRect(x: 80, y: 80, width: 200, height: 200)
        self.view.addSubview(container)
        
        // set green Container frame up
        // we want the blue square to have the same position as greenConatiner
        // so lets just reuse blueConatiner.frame
        self.greenContainer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.blueContainer.frame = greenContainer.frame
        
        // set background colors
        self.greenContainer.backgroundColor = UIColor.greenColor()
        self.blueContainer.backgroundColor = UIColor.blueColor()
        
        // for now just add the green container
        // we'll add blueContainer as part of the transition animation
        self.container.addSubview(self.greenContainer)
        
        
    }
    
    @IBAction func animateButtonTapped(sender: AnyObject) {
        
        // create a 'tuple' (a pair or more of objects assigned to a single variable)
        var views : (frontView: UIView, backView: UIView)
        
        if((self.greenContainer .superview) != nil){
            views = (frontView: self.greenContainer, backView: self.blueContainer)
        }
        else {
            views = (frontView: self.blueContainer, backView: self.greenContainer)
        }
        
        // set a transition style
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        
        // with no animation block, and a completion block set to 'nil' this makes a single line of code
        UIView.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

