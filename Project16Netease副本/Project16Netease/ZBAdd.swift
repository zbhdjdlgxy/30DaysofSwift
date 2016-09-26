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
    
    
    var firstContentArr : NSArray? //第一页列表
    var secondContentArr : NSArray?//第二页列表
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.setupData()
        self.firstCollectionView.registerClass(AddItemCell.self, forCellWithReuseIdentifier: "AddItemCell")
        self.secondCollectionView.registerClass(AddItemCell.self, forCellWithReuseIdentifier: "AddItemCell")
        self.secondCollectionView.hidden = true
        
        self.backgroundColor = UIColor.init(red: 246/255.0, green: 244/255.0, blue: 245/255.0, alpha: 0.95)
        self.addSubview(self.firstCollectionView)
        self.addSubview(self.secondCollectionView)
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
        firstContentArr = NSArray(contentsOfFile: path!)
        firstCollectionView.reloadData()
        
        let path2 = NSBundle.mainBundle().pathForResource("AddSecondItems.plist", ofType: nil)
        secondContentArr = NSArray(contentsOfFile: path2!)
        secondCollectionView.reloadData()
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.dateLabel.frame = CGRectMake(10, 100, SCREENW, 30)
        self.adImageView.frame = CGRectMake(SCREENW - 140 - 10, 66, 140, 140)
        
        self.firstCollectionView.frame = CGRectMake(0, SCREENH, SCREENW, SCREENH - 300 - 49)
        self.firstCollectionView.contentInset = UIEdgeInsetsMake(0, 20, 0, 20)
        
        self.secondCollectionView.frame = CGRectMake(0, 300, SCREENW, SCREENH - 300 - 49)
        self.secondCollectionView.contentInset = UIEdgeInsetsMake(0, 20, 0, 20)
        
        
        self.exitBtn.frame = CGRectMake(0, SCREENH - 49, SCREENW, 49)
        self.backBtn.frame = CGRectMake(0, SCREENH - 49, SCREENW/2, 49)
        self.exitBtn2.frame = CGRectMake(SCREENW/2, SCREENH - 49, SCREENW/2, 49)
        
        self.exitImgView.frame = CGRectMake((SCREENW - 50)/2,SCREENH - 49 , 50, 50)
        UIView.animateWithDuration(0.3) {
            self.exitImgView.transform = CGAffineTransformMakeRotation((CGFloat)(M_PI/4))
        }
        self.exitImgView.transform = CGAffineTransformMakeRotation((CGFloat)(M_PI/4))
        
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: .CurveLinear, animations: {
        self.firstCollectionView.frame = CGRectMake(0, 300, SCREENW, SCREENH - 300 - 49)
        
        }, completion: nil)
        
    }
    
    func exitAction() {

        
        self.removeFromSuperview()
    }
    
    func backAction() {
        self.firstCollectionView.hidden = false
        self.secondCollectionView.hidden = true
        self.exitBtn2.hidden = true
        self.backBtn.hidden = true
        
        self.exitBtn.hidden = false
        self.exitImgView.hidden = false
        self.firstCollectionView.layer.addAnimation(self.pushAnim(kCATransitionFromLeft), forKey: nil)

    }
    
//    MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return 3
    }
 
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell : AddItemCell = AddItemCell.cellWithCollectionView(collectionView,index : indexPath)
        var msgDic : NSDictionary = NSDictionary()
        
        if collectionView == firstCollectionView {
            msgDic = firstContentArr?.objectAtIndex(indexPath.section * 3 + indexPath.row) as! NSDictionary
        }else{
            msgDic = secondContentArr?.objectAtIndex(indexPath.section * 3 + indexPath.row) as! NSDictionary
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
        
        if collectionView == firstCollectionView{
            if indexPath.section == 1 && indexPath.row == 2 {
                self.exitBtn2.hidden = false
                self.backBtn.hidden = false
                self.exitBtn.hidden = true
                self.exitImgView.hidden = true
                self.firstCollectionView.hidden = true
                self.secondCollectionView.hidden = false
                self.secondCollectionView.layer.addAnimation(self.pushAnim(kCATransitionFromRight), forKey: nil)
                
            }else{
                let msgDic = firstContentArr?.objectAtIndex(indexPath.section * 3 + indexPath.row) as! NSDictionary
                self.delegate?.zBAdd(selectIndex: indexPath, title: msgDic["title"] as! String)
            }
            
        }else{
            let msgDic = secondContentArr?.objectAtIndex(indexPath.section * 3 + indexPath.row) as! NSDictionary
            self.delegate?.zBAdd(selectIndex: indexPath, title: msgDic["title"] as! String)
        }
        
    }
    
    //转场动画
    
    func pushAnim(direction : String) -> CATransition {
        let anim : CATransition = CATransition.init()
        anim.type = kCATransitionPush
        anim.subtype = direction
        anim.duration = 0.6
        anim.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        return anim
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
    
    lazy var firstCollectionView : UICollectionView = {
        var layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collect : UICollectionView = UICollectionView.init(frame: CGRectZero, collectionViewLayout: layout)
        collect.delegate = self
        collect.dataSource = self
        collect.backgroundColor = UIColor.clearColor()
        layout.itemSize = CGSizeMake((ZBAdd.screenW - 4 * 40) / 3, (ZBAdd.screenW - 4 * 40) / 3 + 40)
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 30
        return collect
    }()
    
    lazy var secondCollectionView : UICollectionView = {
        var layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collect : UICollectionView = UICollectionView.init(frame: CGRectZero, collectionViewLayout: layout)
        collect.delegate = self
        collect.dataSource = self
        collect.backgroundColor = UIColor.clearColor()
        layout.itemSize = CGSizeMake((ZBAdd.screenW - 4 * 40) / 3, (ZBAdd.screenW - 4 * 40) / 3 + 40)
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 30
        return collect
    }()
    
}
