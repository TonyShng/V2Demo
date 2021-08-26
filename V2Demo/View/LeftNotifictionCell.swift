//
//  LeftNotifictionCell.swift
//  V2Demo
//
//  Created by a on 2021/8/26.
//

import UIKit

class LeftNotifictionCell: LeftNodeTableViewCell {
    
    var notificationCountLabel: UILabel = {
        let label = UILabel()
        label.font = v2Font(10)
        label.textColor = UIColor.white
        label.layer.cornerRadius = 7
        label.layer.masksToBounds = true
        label.backgroundColor = V2EXColor.colors.v2_NoticePointColor
        return label
    }()
    
    override func setup() {
        super.setup()
        
        self.nodeNameLabel.text = NSLocalizedString("")
        
        self.contentView.addSubview(self.notificationCountLabel)
        self.notificationCountLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.nodeNameLabel)
            make.left.equalTo(self.nodeNameLabel.snp.right).offset(5)
            make.height.equalTo(14)
        }
        
        self.kvoController.observe(V2User.shareInstance, keyPath: "notificationCount", options: [.initial, .new]) { [weak self](cell, clien, change) -> Void in
            if V2User.shareInstance.notificationCount > 0 {
                self?.notificationCountLabel.text = "  \(V2User.shareInstance.notificationCount)"
            } else {
                self?.notificationCountLabel.text = ""
            }
        }
    }
    
    
}
