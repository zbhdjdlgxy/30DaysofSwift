//
//  HeadViewController.swift
//  Project - 16 仿网易彩票客户端
//
//  Created by 张标 on 16/8/12.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class HeadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "取消", style: .Bordered, target: self, action: #selector(self.exitView))
    
    }
    
    func exitView() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
