//
//  DataSource.swift
//  Project - 15 多控制器共享数据传值
//
//  Created by 张标 on 16/8/4.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    
    dynamic var moneyStr : NSString = ""
    
    static let sharedInstance : DataSource = DataSource()
}
