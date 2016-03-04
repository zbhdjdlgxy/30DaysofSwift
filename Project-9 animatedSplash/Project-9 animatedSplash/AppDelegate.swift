//
//  AppDelegate.swift
//  Project-9 animatedSplash
//
//  Created by 张标 on 16/2/26.
//  Copyright © 2016年 zhangbiao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mask : CALayer?
    var imageV : UIImageView?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window?.rootViewController = ViewController()
        window?.backgroundColor = UIColor.blueColor()
        window?.makeKeyAndVisible()
        
        imageV = UIImageView(image: UIImage(named: "screen"))
        imageV!.frame = (self.window?.bounds)!
        window?.addSubview(imageV!)
        
        mask = CALayer()
        mask?.contents = UIImage(named: "twitter")?.CGImage
       // mask?.contentsGravity = kCAGravityResizeAspect
        mask?.frame = CGRectMake(0, 0, 100, 81)
       mask?.position = CGPointMake(imageV!.frame.size.width/2, imageV!.frame.size.height/2)
        self.animatedMask()
        return true
    }

    func animatedMask(){
        let anim : CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "bounds")
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.duration = 1.0
        anim.beginTime = CACurrentMediaTime() + 0.5
        anim.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        let value1 = NSValue(CGRect: (mask?.bounds)!)
        let value2 = NSValue(CGRect: CGRectMake(0, 0, 90, 72))
        let value3 = NSValue(CGRect: CGRectMake(0, 0, 1600, 1280))
        anim.values = [value1,value2,value3]
        anim.keyTimes = [0, 0.3, 1]
        mask?.addAnimation(anim, forKey: "bounds")
        imageV?.layer.mask = mask
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

