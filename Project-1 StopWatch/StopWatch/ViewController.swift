//
//  ViewController.swift
//  StopWatch
//
//  Created by 张标 on 16/2/17.
//  Copyright © 2016年 zhangbiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var timer  = NSTimer()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var currentTime : Int = 0;
    
    var isPlaying : Bool = false
    
    @IBOutlet weak var time: UILabel!
    
    func updateTime(){
        currentTime += 1;
        time.text = String(currentTime)
    }
    
    @IBAction func reset(sender: AnyObject) {
        currentTime = 0
        time.text = String(currentTime)
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func play(sender: AnyObject) {
        if isPlaying{
            return
        }else{
            isPlaying = true
        }
       timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    }

    @IBAction func pause(sender: AnyObject) {
        if isPlaying {
            isPlaying = false
        }else{
            return
        }
        timer.invalidate()
    }
}

