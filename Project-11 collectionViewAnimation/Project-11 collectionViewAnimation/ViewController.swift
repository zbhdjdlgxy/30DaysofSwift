//
//  ViewController.swift
//  Project-11 collectionViewAnimation
//
//  Created by 张标 on 16/2/29.
//  Copyright © 2016年 zhangbiao. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell : UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        let image : UIImageView = cell.viewWithTag(1) as! UIImageView
        let lbl : UILabel = cell.viewWithTag(3) as! UILabel
        let backBtn : UIButton = cell.viewWithTag(2) as! UIButton
        backBtn.backgroundColor = UIColor.greenColor()
        backBtn.addTarget(self, action: Selector("back"), forControlEvents: UIControlEvents.TouchUpInside)
        image.image = UIImage(named: String(indexPath.section + 1))
        lbl.text = String(indexPath.section) + "abcd"
        backBtn.hidden = true
        return cell
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return 4
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        let cell : UICollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath)!
        cell.superview?.bringSubviewToFront(cell)
        let backBtn : UIButton = cell.viewWithTag(2) as! UIButton
        backBtn.hidden = false
        UIView.animateWithDuration(1) { () -> Void in
            cell.frame = collectionView.bounds
            print("frame = \(collectionView.bounds)")
        }
        collectionView.scrollEnabled = false
    }
 
    func back(){
        let indexPath = self.collectionView!.indexPathsForSelectedItems()
        self.collectionView?.scrollEnabled = true
        self.collectionView?.reloadItemsAtIndexPaths(indexPath!)
    }
    
    
}
