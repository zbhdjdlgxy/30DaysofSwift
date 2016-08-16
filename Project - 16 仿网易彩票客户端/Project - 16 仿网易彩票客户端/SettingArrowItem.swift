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
    

    func item(title : String,destVC : AnyClass,icon: String = "") -> SettingArrowItem{
        self.item(title, icon: icon)
        self.destVc = destVC
        return self
    }
    
}
