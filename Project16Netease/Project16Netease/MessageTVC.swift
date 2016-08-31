//
//  MessageTVC.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/10.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

final class MessageTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       self.requestForList()
    }

    func requestForList() {
        
        let shopParam : ShopCarListParam = ShopCarListParam()
        shopParam.Key = "admin"
        shopParam.UserId = "78"
        shopParam.StationId = "3"
        ShopCarTool.shopCarListWithParam(shopParam, success: { (result) in
            let shopCarList : ShopCarListResult = result
            for item in shopCarList.DataList!{
                print(item)
            }
            }) { (error) in
                print(error.localizedDescription)
        }
        
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 0
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier : String = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? SettingCell
        if cell == nil {
            cell = SettingCell.init(style: .Default, reuseIdentifier: identifier)
        }
        return cell!
    }
    

    

}
