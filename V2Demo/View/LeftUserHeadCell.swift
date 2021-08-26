//
//  LeftUserHeadCell.swift
//  V2Demo
//
//  Created by a on 2021/8/26.
//

import UIKit

class LeftUserHeadCell: UITableViewCell {
    
    // 头像
    var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(white: 0.9, alpha: 0.3)
        imageView.layer.borderWidth = 1.5
        imageView.layer.borderColor = UIColor(white: 1, alpha: 0.6).cgColor
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 38
        return imageView
    }()
    
    // 用户名
    var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = v2Font(16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() -> Void {
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.userNameLabel)
        
        self.avatarImageView.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.contentView)
            make.centerY.equalTo(self.contentView).offset(-8)
            make.width.height.equalTo(self.avatarImageView.layer.cornerRadius * 2)
        }
        
        self.userNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.avatarImageView.snp.bottom).offset(10)
            make.centerX.equalTo(self.avatarImageView)
        }
        
        self.kvoController.observe(V2User.shareInstance, keyPath: "username", options: [.initial, .new]) { [weak self] (observe, observer, change) -> Void in
            if let weakSelf = self {
                weakSelf.userNameLabel.text = V2User.shareInstance.username ?? "请先登录"
//                if let avatar = V2User.shareInstance. {
//                    <#code#>
//                }
            }
        }
        
        self.themeChangedHandler = {[weak self](style) -> Void in
            self?.userNameLabel.textColor = V2EXColor.colors.v2_TopicListUserNameColor
        }
    }
    

}
