//
//  BaseTVC.swift
//  Project - 16 仿网易彩票客户端
//
//  Created by 张标 on 16/8/15.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class BaseTVC: UITableViewController {

    var data : Array<SettingGroup>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return (data?.count)!
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group : SettingGroup = data![section]
        return (group.items?.count)!
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell = SettingCell.cellWithTableView(tableView) 
        
        let group : SettingGroup = self.data![indexPath.section]
        cell.item = group.items![indexPath.row] as? SettingItem
        
        return cell
    }

}
