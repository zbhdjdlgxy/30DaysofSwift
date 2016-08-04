//
//  AAVC.swift
//  Project - 15 多控制器共享数据传值
//
//  Created by 张标 on 16/8/4.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class AAVC: UIViewController,UITextFieldDelegate{
    
    var data : DataSource = DataSource.sharedInstance
    
    @IBOutlet weak var moneyTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        data.moneyStr = moneyTF.text!
        data.addObserver(self, forKeyPath: "moneyStr", options: NSKeyValueObservingOptions.New, context: nil)
    }
   
    //    MARK: UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {
        data.moneyStr = moneyTF.text!
    }
    
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "moneyStr"{
            moneyTF.text = data.moneyStr as String
        }
    }

}
