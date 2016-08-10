//
//  BaseNavCTL.swift
//  Project - 16 仿网易彩票客户端
//
//  Created by 张标 on 16/8/8.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class BaseNavCTL: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool){
        if self.viewControllers.count > 0{
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
        
    }

}
