//
//  NewFeatureViewController.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/5.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class NewFeatureViewController: UIViewController,UIScrollViewDelegate {

    let W = UIScreen.mainScreen().bounds.size.width
    let H = UIScreen.mainScreen().bounds.size.height
    
    
    override func viewDidLoad() {
       
        
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func loadView() {
        
        self.view = UIView()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.page.center = CGPointMake(0, self.H-30)
        self.page.bounds = CGRectMake(0, 0, 100, 30);
        self.logBtn.frame = CGRectMake(2 * self.W + (self.W - 100) / 2, self.H - 100, 100,38 )
        self.scroll.addSubview(self.logBtn)
        self.view.addSubview(self.scroll)
        self.view.addSubview(self.page)
        
    }
    func startWeibo(){
        let mainCtl : MainTabbarController = MainTabbarController()
        UIApplication.sharedApplication().keyWindow?.rootViewController = mainCtl
    }
//    MARK: UIScrollViewDelegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let page = scrollView.contentOffset.x / self.W
        self.page.currentPage = (Int)(page)
    }
    

// MARK: lazy
    lazy var scroll : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRectMake(0, 0, self.W, self.H)
        scrollView.contentSize = CGSizeMake(self.W * 3, self.H)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.delegate = self
        for i in 0..<3{
            let fealture : UIImageView = UIImageView()
            fealture.image = UIImage.init(named: String.init(format: "new_feature_%d", i+1))
            fealture.frame = CGRectMake((CGFloat)(i) * self.W, 0, self.W, self.H)
            scrollView.addSubview(fealture)
        }
        return scrollView
        
    }()
    
    lazy var page : UIPageControl = {
        
        let pageCtl = UIPageControl()
        pageCtl.pageIndicatorTintColor = UIColor.blackColor()
        pageCtl.currentPageIndicatorTintColor = UIColor.redColor()
        pageCtl.currentPage = 0
        pageCtl.numberOfPages = 3
        return pageCtl
    }()
    
    lazy var logBtn : UIButton = {
        
        let btn : UIButton = UIButton.init(type: .Custom)
        btn.setTitle("开始微博", forState: .Normal)
        btn.backgroundColor = UIColor.blueColor()
        btn.addTarget(self, action: #selector(self.startWeibo), forControlEvents: .TouchUpInside)
        return btn
        
    }()

}

