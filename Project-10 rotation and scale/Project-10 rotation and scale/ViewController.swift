//
//  ViewController.swift
//  Project-10 rotation and scale
//
//  Created by 张标 on 16/2/29.
//  Copyright © 2016年 zhangbiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //image.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
        UIView.animateWithDuration(2) { () -> Void in
            self.image.transform = CGAffineTransformMakeScale(1.5, 1.5)
        }
        
    }

    @IBOutlet weak var image: UIImageView!

}

