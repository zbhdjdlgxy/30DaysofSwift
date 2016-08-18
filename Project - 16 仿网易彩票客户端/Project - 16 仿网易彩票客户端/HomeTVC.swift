//
//  HomeTVC.swift
//  Project - 16 仿网易彩票客户端
//
//  Created by 张标 on 16/8/8.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit
class HomeTVC: UITableViewController {
    
    var dataCount : Int = 5
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(Int64)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
                
                self.dataCount += 5
                self.tableView.reloadData()
                self.tableView.mj_header.endRefreshing()
            })
        })
        self.tableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(Int64)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
                
                self.dataCount += 5
                self.tableView.reloadData()
                self.tableView.mj_footer.endRefreshing()
            })
        })
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataCount
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let indentifer : String = "home"
        var cell = tableView.dequeueReusableCellWithIdentifier(indentifer)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: indentifer)
        }
        cell!.textLabel?.text = "abcd"
        // Configure the cell...
        
        return cell!
    }
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let addTVC : AddFriendsTVC = AddFriendsTVC()
        addTVC.title = "添加朋友"
        self.navigationController?.pushViewController(addTVC, animated: true)
        
    }

   

}
