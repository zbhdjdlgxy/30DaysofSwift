//
//  RefreshCtl.swift
//  Project-4 下拉刷新
//
//  Created by 张标 on 16/2/23.
//  Copyright © 2016年 zhangbiao. All rights reserved.
//

import UIKit

class RefreshTVC: UITableViewController {
    
    var teams : [String] = ["皇马","曼联","切尔西"]
    var refresh : UIRefreshControl = UIRefreshControl()

    override func viewDidLoad() {
        self.refreshControl = self.refresh
        self.refreshControl?.addTarget(self, action:"updateData", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    func updateData(){
        teams.insert("巴萨", atIndex: 0)
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
//    MARK: UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(RefreshTVC.identifier,forIndexPath: indexPath)
        //cell?.textLabel?.text = teams.objectAtIndex(indexPath.row) as? String
        cell?.textLabel?.text = teams[indexPath.row]
        return cell!
    }
    
    static let identifier : String = "cell"

}
