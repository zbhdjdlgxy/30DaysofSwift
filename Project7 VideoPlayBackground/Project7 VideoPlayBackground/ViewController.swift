//
//  ViewController.swift
//  Project7 VideoPlayBackground
//
//  Created by 张标 on 16/2/25.
//  Copyright © 2016年 zhangbiao. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class ViewController: AVPlayerViewController {

    func playerItemDidReachEnd(){
        self.player?.seekToTime(kCMTimeZero)
        self.player?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showsPlaybackControls = false
        self.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        let path = NSBundle.mainBundle().pathForResource("moments.mp4", ofType: nil)
        let player : AVPlayer = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        self.player = player
        player.play()
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "playerItemDidReachEnd",
            name: AVPlayerItemDidPlayToEndTimeNotification,
            object: nil)
        
        let imageV = UIImageView(image: UIImage(named: "login-secondary-logo"))
        imageV.frame = CGRectMake((screenWidth-218)/2, 40, 218, 66)
        print("frame = \(imageV.frame)")
        self.view.addSubview(imageV)
        
        let registerBtn = UIButton(type: UIButtonType.Custom)
        registerBtn.setTitle("注册", forState: UIControlState.Normal)
        registerBtn.frame = CGRectMake((screenWidth-200)/2, screenHeight - 40 - 10, 200, 40)
        registerBtn.backgroundColor = UIColor.greenColor()
        
        let logBtn = UIButton(type: UIButtonType.Custom)
        logBtn.setTitle("登录", forState: UIControlState.Normal)
        logBtn.frame = CGRectMake((screenWidth-200)/2, CGRectGetMinY(registerBtn.frame) - 10 - 40, 200, 40)
        logBtn.backgroundColor = UIColor.greenColor()
        
        self.view.addSubview(logBtn)
        self.view.addSubview(registerBtn)
    }

    
}

