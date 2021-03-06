//
//  RightNodeTableViewCell.swift
//  V2Demo
//
//  Created by a on 2021/8/25.
//

import UIKit

class RightNodeTableViewCell: UITableViewCell {
    
    var nodeNameLabel: UILabel = {
        let label = UILabel()
        label.font = v2Font(15)
        return label
    }()
    
    var panel = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() -> Void {
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear
        
        self.contentView.addSubview(panel)
        self.panel.snp.makeConstraints { (make) -> Void in
            make.left.top.right.equalTo(self.contentView)
            make.bottom.equalTo(self.contentView).offset(-1 * SEPARATOR_HEIGHT)
        }
        
        panel.addSubview(self.nodeNameLabel)
        self.nodeNameLabel.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(panel).offset(-22)
            make.centerY.equalTo(panel)
        }
        
        self.themeChangedHandler = {[weak self] (style) -> Void in
            self?.refreshBackgroundColor()
            self?.nodeNameLabel.textColor = V2EXColor.colors.v2_LeftNodeTintColor
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.refreshBackgroundColor()
    }
    
    func refreshBackgroundColor() {
        if self.isSelected {
            self.panel.backgroundColor = V2EXColor.colors.v2_LeftNodeBackgroundHighLightedColor
        } else {
            self.panel.backgroundColor = V2EXColor.colors.v2_LeftNodeBackgroundColor
        }
    }
    

}
