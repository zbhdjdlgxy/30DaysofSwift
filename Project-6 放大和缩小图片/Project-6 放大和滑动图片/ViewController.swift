//
//  ViewController.swift
//  Project-6 放大和滑动图片
//
//  Created by 张标 on 16/2/25.
//  Copyright © 2016年 zhangbiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var distance : CGFloat?
    var icon : UIImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        icon.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.width)
        icon.center = self.view.center
        icon.image = UIImage(named: "steve")
        self.view.multipleTouchEnabled = true
        self.view.addSubview(icon)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if touches.count == 2{
            let array = NSMutableArray()
            for point in touches{
                array.addObject(point)
            }
           distance = self.countDistance(array[0] as! UITouch,endPoint: array[1] as! UITouch)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if touches.count == 2{
            let array = NSMutableArray()
            for point in touches{
                array.addObject(point)
            }
            let currentDistance = self.countDistance(array[0] as! UITouch,endPoint: array[1] as! UITouch)
            let scale = currentDistance / distance!
            if scale > 0.5 && scale < 2 {
                icon.frame = CGRectMake(0, 0, self.view.frame.size.width * scale, self.view.frame.size.height * scale)
                icon.center = self.view.center
            }
        }
    }
    
    func countDistance(startPoint : UITouch,endPoint : UITouch) -> CGFloat{
        let point1 = startPoint.locationInView(self.view)
        let point2 = endPoint.locationInView(self.view)
        let x = point2.x - point1.x
        let y = point2.y - point1.y
        return sqrt(x * x + y * y)
    }
}

