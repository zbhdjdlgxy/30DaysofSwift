//
//  GeneralSetTVC.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/15.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class GeneralSetTVC: BaseTVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.data = Array()
        self.setupGroup()
        self.setupGroup2()
        self.setupGroup3()
        self.setupGroup4()
        self.setupGroup5()
        
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: .Grouped)
    }
    
    init(){
        super.init(style: .Grouped)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: dataSource
    func setupGroup(){
        let item = SettingArrowItem()
        item.item("阅读模式")
        let item2 = SettingArrowItem()
        item2.item("字号大小")
        let item3 = SettingSwitchItem()
        item3.item("显示备注")
        let group : SettingGroup = SettingGroup()
        group.items = [item,item2,item3]
        self.data.append(group)
    }
    
    func setupGroup2(){
        
        let item = SettingArrowItem()
        item.item("图片质量设置")
        let group : SettingGroup = SettingGroup()
        group.items = [item]
        self.data.append(group)
    }
    func setupGroup3(){
        
        let item = SettingSwitchItem()
        item.item("声音")
        let group : SettingGroup = SettingGroup()
        group.items = [item]
        self.data.append(group)
    }
    func setupGroup4(){
        
        let item = SettingSwitchItem()
        item.item("多语言环境")
        let group : SettingGroup = SettingGroup()
        group.items = [item]
        self.data.append(group)
    }
    
    func setupGroup5(){
        
        let item = SettingArrowItem()
        item.item("清除图片缓存")
        item.option = {
            
            print("清除缓存中...")
        }
        let item2 = SettingArrowItem()
        item2.item("清空搜索历史")
        let group : SettingGroup = SettingGroup()
        group.items = [item,item2]
        self.data.append(group)
    }
}
