//
//  SettingItem.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/15.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

typealias operationOption = (() -> Void)
class SettingItem: NSObject {
    

    var title : String?
    var icon : String?
    var option : operationOption?
    
    func item(title : String,icon : String)-> AnyObject{
        
        self.item(title)
        self.icon = icon
        return self
        
    }
    
    func item(title : String)-> AnyObject{
        
        self.title = title
        return self
        
    }
}
