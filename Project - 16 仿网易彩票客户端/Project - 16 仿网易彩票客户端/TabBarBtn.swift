//
//  TabBarBtn.swift
//  Project - 16 仿网易彩票客户端
//
//  Created by 张标 on 16/8/9.
//  Copyright © 2016年 szgyzb. All rights reserved.
//
// 图标的比例

import UIKit


class TabBarBtn: UIButton {
    
    var badgeButton : BadgeButton = BadgeButton()
    
    var item : UITabBarItem = UITabBarItem(){
        
        willSet{
            self.item = newValue
            newValue.addObserver(self, forKeyPath: "badgeValue", options: .New, context: nil)
            newValue.addObserver(self, forKeyPath: "title", options: .New, context: nil)
            newValue.addObserver(self, forKeyPath: "image", options: .New, context: nil)
            newValue.addObserver(self, forKeyPath: "selectedImage", options: .New, context: nil)
            
            self.observeValueForKeyPath(nil, ofObject: nil, change: nil, context: nil)
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        // 图标居中
        self.imageView!.contentMode = .Center;
        // 文字居中
        self.titleLabel!.textAlignment = .Center;
        // 字体大小
        self.titleLabel!.font = UIFont.systemFontOfSize(11);
        // 文字颜色
        self.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.setTitleColor(UIColor.rgbColor(234,green:103,blue:7), forState: .Normal)
        self.highlighted = false
        // 添加一个提醒数字按钮
        badgeButton.autoresizingMask = .FlexibleLeftMargin
        self.addSubview(badgeButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        
        let imageW : CGFloat = contentRect.size.width;
        let imageH : CGFloat = contentRect.size.height * 0.6;
        return CGRectMake(0, 0, imageW, imageH);
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        
        let titleY : CGFloat = contentRect.size.height * 0.6;
        let titleW : CGFloat = contentRect.size.width;
        let titleH : CGFloat = contentRect.size.height - titleY;
        return CGRectMake(0, titleY, titleW, titleH);
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        // 设置文字
        self.setTitle(self.item.title, forState:.Selected)
        self.setTitle(self.item.title ,forState:.Normal);
        
        // 设置图片
        self.setImage(self.item.image,forState:.Normal);
        self.setImage(self.item.selectedImage,forState:.Selected)
        
        // 设置提醒数字
        if self.item.badgeValue != nil {
            self.badgeButton.badgeValue = self.item.badgeValue!;
        }else{
            self.badgeButton.badgeValue = ""
        }
        
        
        // 设置提醒数字的位置
        let badgeY : CGFloat = 5;
        let badgeX : CGFloat = self.frame.size.width - self.badgeButton.frame.size.width - 10;
        var badgeF : CGRect = self.badgeButton.frame;
        badgeF.origin.x = badgeX;
        badgeF.origin.y = badgeY;
        self.badgeButton.frame = badgeF;
    }
    
    

}
