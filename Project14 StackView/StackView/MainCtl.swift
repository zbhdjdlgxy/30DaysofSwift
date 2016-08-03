//
//  MainCtl.swift
//  StackView
//
//  Created by 张标 on 16/8/2.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class MainCtl: UIViewController {

    final var listView : UIStackView = UIStackView()
    static let screenW : CGFloat = UIScreen.mainScreen().bounds.width
    static let screenH : CGFloat = UIScreen.mainScreen().bounds.height
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func loadView() {
        
        
        self.view = UIView.init(frame: CGRectMake(0, 0, MainCtl.screenW, MainCtl.screenH))
        listView.frame = CGRectMake((MainCtl.screenW - 301)/2, 200, 301, 400)
        listView.axis = .Vertical
        listView.alignment = .Fill
        listView.distribution = .FillEqually
        let addBtn : UIButton = UIButton.init(type: .Custom)
        addBtn.backgroundColor = UIColor.grayColor()
        addBtn.frame = CGRectMake(20, 100, 100, 38)
        addBtn.setTitle("add", forState: .Normal)
        addBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        addBtn.addTarget(self, action: #selector(self.addAction), forControlEvents: .TouchUpInside)
        
        let removeBtn : UIButton = UIButton.init(type: .Custom)
        removeBtn.backgroundColor = UIColor.grayColor()
        removeBtn.frame = CGRectMake(MainCtl.screenW - 20 - 100, 100, 100, 38)
        removeBtn.setTitle("remove", forState: .Normal)
        removeBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        removeBtn.addTarget(self, action: #selector(self.removeAction), forControlEvents: .TouchUpInside)
        
        
        self.view.addSubview(addBtn)
        self.view.addSubview(removeBtn)
        self.view.addSubview(listView)
    }
    
    func addAction() -> Void {
        let headImg : UIImageView = UIImageView(image: UIImage.init(named: "logo"))
        headImg.contentMode = .ScaleAspectFit
        listView.addArrangedSubview(headImg)
        
    }
    
    func removeAction() -> Void {
        
        let lastView = listView.arrangedSubviews.last
        if lastView != nil {
            listView.removeArrangedSubview(lastView!)
            lastView!.removeFromSuperview()
        }
        
    }


}
