//
//  SettingItem.swift
//  Project - 16 仿网易彩票客户端
//
//  Created by 张标 on 16/8/15.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class SettingItem: NSObject {
    

    var title : String?
    var icon : String?
    
    class func item() -> SettingItem{
        
        let item : SettingItem = SettingItem()
        return item
        
    }
    class func item(title : String)-> SettingItem{
        
        
        let item : SettingItem = SettingItem()
        item.title = title
        return item
    }
    class func item(title : String,icon : String)-> SettingItem{
        
        let item : SettingItem = SettingItem()
        item.title = title
        item.icon = icon
        return item
        
    }
    
}
