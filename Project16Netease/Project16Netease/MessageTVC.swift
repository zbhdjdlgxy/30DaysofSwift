//
//  MessageTVC.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/10.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

final class MessageTVC: UITableViewController {
    
    var goodsArr : Array<ShopCarGoodsItem>  = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 60
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
               self.goodsArr.append(item)
            }
            self.tableView.reloadData()
            }) { (error) in
                print(error.localizedDescription)
        }
        
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return goodsArr.count
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier : String = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .Subtitle, reuseIdentifier: identifier)
        }
        let goodsItem : ShopCarGoodsItem = self.goodsArr[indexPath.row]
        let imgData  = NSData.init(contentsOfURL: NSURL.init(string: goodsItem.GoodsThumbImg1!)!)
        cell?.imageView?.image = UIImage.init(data: imgData!)
        cell?.textLabel?.text = goodsItem.GoodsName
        cell?.detailTextLabel?.text = "售价:" + goodsItem.GoodsPrice! + "元"
        return cell!
    }
    

    

}
