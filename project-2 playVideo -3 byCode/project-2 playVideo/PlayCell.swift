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
    
    var playBtn: UIButton?
    var videoPic: UIImageView?
    
    weak var delegate : PlayCellDelegate?
    class func playCellWithTableView(tableView : UITableView) -> PlayCell{
        var playCell : PlayCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? PlayCell
        if playCell == nil{
            playCell = PlayCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
        }
        playCell?.selectionStyle = UITableViewCellSelectionStyle.None
        return playCell!
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        playBtn = UIButton()
        playBtn?.addTarget(self, action: Selector.init("play:"), forControlEvents: UIControlEvents.TouchUpInside)
        videoPic = UIImageView()
        self.addSubview(videoPic!)
        self.addSubview(playBtn!)
    }
    
    override func layoutSubviews() {
        playBtn?.frame = CGRectMake(0, 0, 50, 50)
        playBtn?.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        videoPic?.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func play(sender: AnyObject) {
        if ((delegate?.respondsToSelector("playBtnDidClick")) != nil){
            delegate?.playBtnDidClick(self)
        }
    }
    private static  var identifier : String = "PlayCell"
}
