//
//  PlayCell.swift
//  project-2 playVideo
//
//  Created by 张标 on 16/2/18.
//  Copyright © 2016年 zhangbiao. All rights reserved.
//

import UIKit

protocol PlayCellDelegate : NSObjectProtocol{
    func playBtnDidClick(cell : PlayCell)
}

class PlayCell: UITableViewCell{
    
    @IBAction func play(sender: AnyObject) {
        if ((delegate?.respondsToSelector("playBtnDidClick")) != nil){
            delegate?.playBtnDidClick(self)
        }
    }
    
    weak var delegate : PlayCellDelegate?
    
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var videoPic: UIImageView!
    
    class func playCellWithTableView(tableView : UITableView) -> PlayCell{
        var playCell : PlayCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? PlayCell
        if playCell == nil{
            playCell = NSBundle.mainBundle().loadNibNamed(identifier, owner: nil, options: nil).first as? PlayCell
        }
        playCell?.selectionStyle = UITableViewCellSelectionStyle.None
        return playCell!
    }
    
    private static  var identifier : String = "PlayCell"
}
