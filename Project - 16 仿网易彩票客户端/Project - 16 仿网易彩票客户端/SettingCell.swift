//
//  SettingCell.swift
//  Project - 16 仿网易彩票客户端
//
//  Created by 张标 on 16/8/15.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

final class SettingCell: UITableViewCell {

    var item : SettingItem = SettingItem(){
        
        willSet{

            if newValue.icon != nil {
                self.imageView?.image = UIImage.init(named: newValue.icon!)
            }
            self.textLabel?.text = newValue.title
            if newValue is SettingArrowItem {
                self.accessoryType = .DisclosureIndicator
            }else if newValue is SettingSwitchItem{
                
                self.accessoryView = UISwitch.init()
            }
        }
    }
    
    
    class func cellWithTableView(tableView : UITableView) -> SettingCell {
        
        let identifier : String = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? SettingCell
        if cell == nil {
            cell = SettingCell.init(style: .Default, reuseIdentifier: identifier)
        }
        return cell!
    }
}
