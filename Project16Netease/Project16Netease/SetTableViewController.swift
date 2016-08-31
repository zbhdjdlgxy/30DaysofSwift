//
//  SetTableViewController.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/16.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class SetTableViewController: BaseTVC,SetFooterViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGroup()
        self.setupGroup2()
        self.setupGroup3()
        self.setupGroup4()
        
        let footer : SetFooterView = SetFooterView.init(frame: CGRectMake(0, 0, self.tableView.frame.size.width, 50))
        footer.delegate = self
        self.tableView.tableFooterView = footer
    }
//    MARK: SetFooterViewDelegate
    func SetFooterViewDidLogOutBtnClicked(){
        
        print("log out")
    }
    
    //    MARK: dataSource
    func setupGroup(){
        let item = SettingArrowItem()
        item.item("账号管理")
        let group : SettingGroup = SettingGroup()
        group.items = [item]
        self.data.append(group)
    }
    
    func setupGroup2(){
        
        let item = SettingArrowItem()
        item.item("主题、背景")
        let group : SettingGroup = SettingGroup()
        group.items = [item]
        self.data.append(group)
    }
    func setupGroup3(){
        
        let item = SettingArrowItem()
        let item2 = SettingArrowItem()
        let item3 = SettingArrowItem()
        item.item("通知和提醒")
        item2.item("通用设置", destVC: GeneralSetTVC.classForCoder())
        item3.item("隐私和安全")
        let group : SettingGroup = SettingGroup()
        group.items = [item,item2,item3]
        self.data.append(group)
    }
    func setupGroup4(){
        
        let item = SettingArrowItem()
        let item2 = SettingArrowItem()
        item.item("意见反馈")
        item2.item("关于微博")
        let group : SettingGroup = SettingGroup()
        group.items = [item,item2]
        self.data.append(group)
    }
}