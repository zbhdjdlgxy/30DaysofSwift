//
//  Add.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/11.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

protocol ZBAddDelegate {
    
    func zBAdd(selectIndex selectItemIndex : NSIndexPath,title: String)
}


final class ZBAdd: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    static let screenW : CGFloat = UIScreen.mainScreen().bounds.width

    var delegate : ZBAddDelegate?
    
    
    var contentArr : NSArray? //第一页列表
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.setupData()
        self.firstCollectionView.registerClass(AddItemCell.self, forCellWithReuseIdentifier: "AddItemCell")
        
        self.backgroundColor = UIColor.init(red: 246/255.0, green: 244/255.0, blue: 245/255.0, alpha: 0.95)
        self.addSubview(self.firstCollectionView)
        self.addSubview(self.dateLabel)
        self.addSubview(self.adImageView)
        self.addSubview(self.backBtn)
        self.addSubview(self.exitBtn2)
        self.addSubview(self.exitBtn)
        self.addSubview(self.exitImgView)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(){
        
        let path = NSBundle.mainBundle().pathForResource("AddFirstItems.plist", ofType: nil)
        contentArr = NSArray(contentsOfFile: path!)
        firstCollectionView.reloadData()

    }

    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.dateLabel.frame = CGRectMake(10, 100, SCREENW, 30)
        self.adImageView.frame = CGRectMake(SCREENW - 140 - 10, 66, 140, 140)
        
        self.firstCollectionView.frame = CGRectMake(0, SCREENH, SCREENW, 0)
        self.exitBtn.frame = CGRectMake(0, SCREENH - 49, SCREENW, 49)
        self.backBtn.frame = CGRectMake(0, SCREENH - 49, SCREENW/2, 49)
        self.exitBtn2.frame = CGRectMake(SCREENW/2, SCREENH - 49, SCREENW/2, 49)
        
        self.exitImgView.frame = CGRectMake((SCREENW - 50)/2,SCREENH - 49 , 50, 50)
        UIView.animateWithDuration(0.3) {
            self.exitImgView.transform = CGAffineTransformMakeRotation((CGFloat)(M_PI/4))
        }
        self.exitImgView.transform = CGAffineTransformMakeRotation((CGFloat)(M_PI/4))
        let firstCollectionViewH = SCREENH * 0.4
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: .CurveLinear, animations: {
            self.firstCollectionView.frame = CGRectMake(0, SCREENH - firstCollectionViewH - 49, SCREENW, firstCollectionViewH)
        
        }, completion: nil)
        
    }
    
    func exitAction() {

        
        self.removeFromSuperview()
    }
    
    func backAction() {
        self.firstCollectionView.hidden = false
        self.exitBtn2.hidden = true
        self.backBtn.hidden = true
        
        self.exitBtn.hidden = false
        self.exitImgView.hidden = false
        self.firstCollectionView.scrollToItemAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 0), atScrollPosition: .Right, animated: true)
    }
    
//    MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return 6
    }
 
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell : AddItemCell = AddItemCell.cellWithCollectionView(collectionView,index : indexPath)
        var msgDic : NSDictionary = NSDictionary()
        
        if collectionView == firstCollectionView {
            msgDic = contentArr?.objectAtIndex(indexPath.section * 6 + indexPath.row) as! NSDictionary
        }
        
        cell.textLabel.text = msgDic["title"] as? String
        cell.imageView.image = UIImage.init(named: (msgDic["name"] as? String)!)
        return cell
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        
        return 2
    }

//    MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 && indexPath.row == 5 {
            self.exitBtn2.hidden = false
            self.backBtn.hidden = false
            self.exitBtn.hidden = true
            self.exitImgView.hidden = true
            let index : NSIndexPath = NSIndexPath.init(forRow: 5, inSection: 1)
            collectionView.scrollToItemAtIndexPath(index, atScrollPosition: .Left, animated: true)
            
        }else{
            let msgDic = contentArr?.objectAtIndex(indexPath.section * 6 + indexPath.row) as! NSDictionary
            self.delegate?.zBAdd(selectIndex: indexPath, title: msgDic["title"] as! String)
        }
        
    }

    
//    MARK: lazy
    
    lazy var dateLabel : UILabel = {
        
        let dateLbl : UILabel = UILabel()
        let date : NSDate = NSDate()
        let format : NSDateFormatter = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateStr : String = format.stringFromDate(date)
        dateLbl.text = dateStr
        return dateLbl
    }()
    
    lazy var adImageView : UIImageView = {
        
        let imageView : UIImageView = UIImageView.init(image: UIImage.init(named: "adIcon.jpg"))
        return imageView
    }()
    
    lazy var exitBtn : UIButton = {
       
        let exitButton : UIButton = UIButton(type: .Custom)
        exitButton.backgroundColor = UIColor.whiteColor()
        exitButton.addTarget(self, action: #selector(self.exitAction), forControlEvents: .TouchUpInside)
        exitButton.hidden = false
        return exitButton
    }()
    
    lazy var backBtn : UIButton = {
        
        let backButton : UIButton = UIButton(type: .Custom)
        backButton.backgroundColor = UIColor.whiteColor()
        backButton.addTarget(self, action: #selector(self.backAction), forControlEvents: .TouchUpInside)
        backButton.setImage(UIImage.init(named: "back"), forState: .Normal)
        backButton.hidden = false
        return backButton
    }()
    
    lazy var exitBtn2 : UIButton = {
        
        let exitButton : UIButton = UIButton(type: .Custom)
        exitButton.backgroundColor = UIColor.whiteColor()
        exitButton.imageView?.contentMode = .ScaleAspectFill
        exitButton.addTarget(self, action: #selector(self.exitAction), forControlEvents: .TouchUpInside)
        exitButton.setImage(UIImage.init(named: "exit2"), forState: .Normal)
        exitButton.hidden = false
        return exitButton
    }()
    
    lazy var exitImgView : UIImageView = {
       
        let image : UIImageView = UIImageView.init(image: UIImage.init(named: "exit"))
        return image
    }()
    
    let cellW = SCREENW * 0.21
    
    
    lazy var firstCollectionView : UICollectionView = {
        var layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        
        let collect : UICollectionView = UICollectionView.init(frame: CGRectZero, collectionViewLayout: layout)
        collect.delegate = self
        collect.dataSource = self
        collect.backgroundColor = UIColor.clearColor()
        collect.pagingEnabled = true
        collect.showsVerticalScrollIndicator = false
        collect.showsHorizontalScrollIndicator = false
        layout.itemSize = CGSizeMake(self.cellW, self.cellW + 40)
        let mm = (SCREENW - 3 * self.cellW) / 4
        layout.headerReferenceSize = CGSizeMake(mm, 0);
        layout.footerReferenceSize = CGSizeMake(mm, 0);
        layout.minimumLineSpacing = mm
        layout.minimumInteritemSpacing = 0
        
        return collect
    }()

}
