//
//  ViewController.swift
//  Project-8 登录动画
//
//  Created by 张标 on 16/2/25.
//  Copyright © 2016年 zhangbiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var logBtn : UIButton? = UIButton()
    let screenWidth = UIScreen.mainScreen().bounds.width
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        logBtn = UIButton(type: UIButtonType.Custom)
        logBtn?.setTitle("登录", forState: UIControlState.Normal)
        logBtn?.backgroundColor = UIColor.redColor()
        logBtn?.frame = CGRectMake(-100, 40, screenWidth - 2 * 100, 40)
        logBtn?.addTarget(self, action: "log", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(logBtn!)
        UIView.animateWithDuration(0.5) { () -> Void in
            self.logBtn?.frame = CGRectMake(100, 40, self.screenWidth - 2 * 100, 40)
        }
        
    }

    func log(){
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.logBtn?.frame = CGRectMake(80, 40, self.screenWidth - 2 * 80, 40)
            
            }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

