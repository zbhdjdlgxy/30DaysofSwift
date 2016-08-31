//
//  HeadViewController.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/12.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class HeadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "取消", style: .Plain, target: self, action: #selector(self.exitView))
    
    }
    
    func exitView() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
