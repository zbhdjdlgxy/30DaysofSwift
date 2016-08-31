//
//  AddItemCell.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/11.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

final class AddItemCell: UICollectionViewCell {

    
    
    class func cellWithCollectionView(collectionView : UICollectionView,index : NSIndexPath) -> AddItemCell{
        
        let identifier = "AddItemCell"
        let itemCell :  AddItemCell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: index) as! AddItemCell
        return itemCell
        
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.addSubview(self.textLabel)
        self.addSubview(self.imageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.imageView.frame = CGRectMake(2, 2, self.frame.size.width - 4, self.frame.size.width - 4)
        self.textLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.frame.size.width, self.frame.size.height - (self.frame.size.width - 4))
    }
    
//    MARK: lazy
    var imageView : UIImageView = {
        
        var icon : UIImageView = UIImageView.init()
        return icon
    }()

    var textLabel : UILabel = {
        
        var titleLabel : UILabel = UILabel.init()
        titleLabel.textAlignment = .Center
        return titleLabel
    }()
    
}
