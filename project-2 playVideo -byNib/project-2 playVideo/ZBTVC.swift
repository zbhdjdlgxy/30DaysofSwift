//
//  ZBTVC.swift
//  project-2 playVideo
//
//  Created by 张标 on 16/2/18.
//  Copyright © 2016年 zhangbiao. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class ZBTVC: UITableViewController {
    @IBAction func play(sender: AnyObject) {
        let path = NSBundle.mainBundle().pathForResource("emoji zone.mp4", ofType: nil)
        let player : AVPlayer = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        let playerVc = AVPlayerViewController()
        playerVc.player = player
        self.presentViewController(playerVc, animated: true, completion: nil)
        player.play()
    }

}
