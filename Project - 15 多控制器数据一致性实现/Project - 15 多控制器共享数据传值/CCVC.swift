//
//  CCVC.swift
//  Project - 15 多控制器共享数据传值
//
//  Created by 张标 on 16/8/4.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class CCVC: UIViewController {

    @IBOutlet weak var moneyStr: UITextField!
    var data : DataSource = DataSource.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyStr.text = data.moneyStr as String
        
        data.addObserver(self, forKeyPath: "moneyStr", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "moneyStr"{
            moneyStr.text = data.moneyStr as String
        }
    }
    

    @IBAction func backAction(sender: AnyObject) {
        data.moneyStr = moneyStr.text!
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
