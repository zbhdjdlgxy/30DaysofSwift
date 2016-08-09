//
//  BadgeButton.swift
//  Project - 16 仿网易彩票客户端
//
//  Created by 张标 on 16/8/9.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

final class BadgeButton: UIButton {

    var badgeValue : String = ""{
        
        willSet{
            if newValue == "" {
                self.hidden = true
            }else{
                self.hidden = false
                self.setTitle(newValue, forState: .Normal)
                var frame : CGRect = self.frame;
                let badgeH : CGFloat = self.currentBackgroundImage!.size.height;
                var badgeW : CGFloat = self.currentBackgroundImage!.size.width;
                if (newValue.characters.count > 1) {
                    // 文字的尺寸
                    let badgeSize : CGSize = newValue.boundingRectWithSize(CGSizeMake(CGFloat(MAXFLOAT), 1), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName : (self.titleLabel?.font)!], context: nil).size
                    badgeW = badgeSize.width + 10;
                }
                frame.size.width = badgeW;
                frame.size.height = badgeH;
                self.frame = frame;
            }
        }
    }
    
    override init(frame: CGRect){
        
        super.init(frame: frame)
        self.hidden = true;
        self.userInteractionEnabled = false;
        self.setBackgroundImage(UIImage.resizedImageWithName("main_badge"), forState: .Normal)
        self.titleLabel!.font = UIFont.systemFontOfSize(11)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
