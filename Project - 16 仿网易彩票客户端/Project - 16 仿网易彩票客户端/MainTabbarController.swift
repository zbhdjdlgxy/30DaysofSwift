//
//  MainTabbarController.swift
//  Project - 16 仿网易彩票客户端
//
//  Created by 张标 on 16/8/8.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let homeTVC : HomeTVC = HomeTVC()
        homeTVC.title = "主页"
        let navCtl : BaseNavCTL = BaseNavCTL(rootViewController: homeTVC)
        
        let meTVC : MeTVC = MeTVC()
        meTVC.title = "我的"
        let navCtl2 : BaseNavCTL = BaseNavCTL(rootViewController: meTVC)
        
        self.viewControllers = [navCtl,navCtl2]
        
        
    }

}
