//
//  FriendsMsgTVC.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/10.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class FriendsMsgTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("msg")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "msg")
        }
        cell!.textLabel?.text = "ijkl"
        // Configure the cell...
        
        return cell!
    }
    
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.navigationController?.viewControllers = [self.navigationController!.viewControllers.first!,self.navigationController!.viewControllers.last!];
        self.navigationController?.popViewControllerAnimated(true)
    }
  

}
