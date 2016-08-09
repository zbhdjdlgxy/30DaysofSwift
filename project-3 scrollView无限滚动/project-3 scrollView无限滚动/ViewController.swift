//
//  ViewController.swift
//  ScrollView三屏滑动
//
//  Created by 张标 on 16/2/22.
//  Copyright © 2016年 zhangbiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    static let screenWidth = UIScreen.mainScreen().bounds.width
    static let viewSum : CGFloat = 3
    var currentPage : NSInteger = 0
    var contentOff = CGPointMake(ViewController.screenWidth, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSizeMake(ViewController.screenWidth * ViewController.viewSum, scrollView.frame.height)
        let redView : UIView = UIView.init(frame: CGRectMake(0, 0, ViewController.screenWidth, scrollView.frame.height))
        redView.tag = 10;
        redView.backgroundColor = UIColor.redColor()
        
        let greenView : UIView = UIView.init(frame: CGRectMake(ViewController.screenWidth, 0, ViewController.screenWidth, scrollView.frame.height))
        greenView.tag = 11
        greenView.backgroundColor = UIColor.greenColor()
        
        let blueView : UIView = UIView.init(frame: CGRectMake(ViewController.screenWidth * 2, 0, ViewController.screenWidth,scrollView.frame.height))
        blueView.backgroundColor = UIColor.blueColor()
        blueView.tag = 12
        pageControl.currentPage = 1
        currentPage = pageControl.currentPage
        scrollView.contentOffset = CGPointMake(ViewController.screenWidth,0)
        scrollView.bounces = false
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.addSubview(redView)
        scrollView.addSubview(greenView)
        scrollView.addSubview(blueView)
    }
    
    internal func scrollViewDidEndDecelerating(scrollView: UIScrollView){

        print("1 = \(scrollView.contentOffset.y)")
        let page = floor((scrollView.contentOffset.x - ViewController.screenWidth / 2) / ViewController.screenWidth) + 1;
        switch page{
        case 0:
            self.moveToRight()
        case 2:
            self.moveToLeft()
        default:
            return
        }
    }
    
    func moveToLeft(){
        if currentPage == 2{
            pageControl.currentPage = 0
        }else{
            pageControl.currentPage = currentPage + 1
        }
        currentPage = pageControl.currentPage
        
        var view0 = self.scrollView.viewWithTag(10)
        
        var view1 = self.scrollView.viewWithTag(11)
        
        var view2 = self.scrollView.viewWithTag(12)
        
        let tmpView = view0;
        
        view0 = view1;
        
        view1 = view2;
        
        view2 = tmpView;
        
        scrollView.setContentOffset(CGPointMake(320,0), animated: false)
        
        
        view0?.frame = CGRectMake(0,0,ViewController.screenWidth,scrollView.frame.height)
        view1?.frame = CGRectMake(ViewController.screenWidth,0,ViewController.screenWidth,scrollView.frame.height)
        view2?.frame = CGRectMake(ViewController.screenWidth * 2,0,ViewController.screenWidth,scrollView.frame.height)
        
        view0?.tag = 10
        view1?.tag = 11
        view2?.tag = 12
        
    }
    func moveToRight(){
        if currentPage == 0{
            pageControl.currentPage = 2
        }else{
            pageControl.currentPage = currentPage - 1
        }
        currentPage = pageControl.currentPage
        var view0 = self.scrollView.viewWithTag(10)
        
        var view1 = self.scrollView.viewWithTag(11)
        
        var view2 = self.scrollView.viewWithTag(12)
        
        let tmpView = view2;
        
        view2 = view1;
        
        view1 = view0;
        
        view0 = tmpView;
        
        scrollView.setContentOffset(CGPointMake(320,0), animated: false)
        
        
        view0?.frame = CGRectMake(0,0,ViewController.screenWidth,scrollView.frame.height)
        view1?.frame = CGRectMake(ViewController.screenWidth,0,ViewController.screenWidth,scrollView.frame.height)
        view2?.frame = CGRectMake(ViewController.screenWidth * 2,0,ViewController.screenWidth,scrollView.frame.height)
        
        view0?.tag = 10
        view1?.tag = 11
        view2?.tag = 12
    }
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
}

