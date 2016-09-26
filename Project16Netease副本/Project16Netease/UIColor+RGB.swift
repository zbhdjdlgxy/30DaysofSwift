//
//  UIColor+RGB.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/9.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

extension UIColor {

    class func rgbColor(red: CGFloat,green: CGFloat,blue: CGFloat) -> UIColor{
        let color : UIColor = UIColor.init(red: (red/255.0), green: (green/255.0), blue:(blue/255.0), alpha: 1)
        return color
    }
}
