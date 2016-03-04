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

class ZBTVC: UITableViewController,PlayCellDelegate {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : PlayCell = PlayCell.playCellWithTableView(tableView)
        cell.videoPic.image = UIImage(named: String(format: "videoScreenshot0%d", indexPath.row + 1))
        cell.playBtn.setBackgroundImage(UIImage(named: "playBtn"), forState: UIControlState.Normal)
        cell.delegate = self
        return cell
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 100
    }
    func  playBtnDidClick(cell : PlayCell){
        let index : NSIndexPath! = self.tableView.indexPathForCell(cell)
        
        let path : String,playerView : AVPlayer
        
        switch index.row{
        case 0,4,5:
            path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")!
            
        case 1:
            path = NSBundle.mainBundle().pathForResource("1", ofType: "MOV")!
        case 2:
            path = NSBundle.mainBundle().pathForResource("2", ofType: "MOV")!
            
        case 3:
            path = NSBundle.mainBundle().pathForResource("3", ofType: "MOV")!
            
        default:
            return
        }
        playerView = AVPlayer(URL: NSURL(fileURLWithPath: path))
        let playViewController : AVPlayerViewController = AVPlayerViewController()
        playViewController.player = playerView
        self.presentViewController(playViewController, animated: true, completion: nil)
        playerView.play()
    }
}
