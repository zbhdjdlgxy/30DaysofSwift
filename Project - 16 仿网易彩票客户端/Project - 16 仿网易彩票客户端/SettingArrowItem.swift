//
//  SettingArrowItem.swift
//  Project - 16 仿网易彩票客户端
//
//  Created by 张标 on 16/8/15.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

final class SettingArrowItem: SettingItem {

    var destVc : AnyClass?
    
    class func item(title : String,icon : String,destVC : AnyClass) -> SettingArrowItem{
        
        let item : SettingArrowItem = SettingArrowItem()
        item.title = title
        item.icon = icon
        item.destVc = destVC
        return item
    }
    
    class func item(title : String,destVC : AnyClass) -> SettingArrowItem{
        
        let item : SettingArrowItem = SettingArrowItem()
        item.title = title
        item.destVc = destVC
        return item
    }
}
