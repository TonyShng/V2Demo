//
//  LeftViewController.swift
//  V2Demo
//
//  Created by a on 2021/8/25.
//

import UIKit
import FXBlurView

class LeftViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleToFill
        return backgroundImageView
    }()
    
    var frostedView:FXBlurView = {
        let frostedView = FXBlurView()
        frostedView.isDynamic = false
        frostedView.tintColor = UIColor.black
        return frostedView
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        
        tableView .register(LeftUserHeadCell.self, forCellReuseIdentifier: "\(LeftUserHeadCell.self)")
        tableView.register(LeftNodeTableViewCell.self, forCellReuseIdentifier: "\(LeftNodeTableViewCell.self)")
        tableView.register(LeftNotifictionCell.self, forCellReuseIdentifier: "\(LeftNotifictionCell.self)")
        
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            if V2EXColor.sharedInstance.style == V2EXColor.V2EXColorStyleDefault {
                return .darkContent
            } else {
                return .lightContent
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = V2EXColor.colors.v2_backgroundColor
        
        self.backgroundImageView.frame = self.view.frame
        view .addSubview(self.backgroundImageView)
        
        self.frostedView.underlyingView = self.backgroundImageView
        self.frostedView.frame = self.view.frame
        self.view.addSubview(self.frostedView)
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) -> Void in
            make.top.right.bottom.left.equalTo(self.view)
        }
        
        self.themeChangedHandler = { [weak self] (style) -> Void in
            if V2EXColor.sharedInstance.style == V2EXColor.V2EXColorStyleDefault {
                self?.backgroundImageView.image = UIImage(named: "32.jpg")
            } else {
                self?.backgroundImageView.image = UIImage(named: "12.jpg")
            }
            self?.frostedView.updateAsynchronously(true, completion: nil)
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [1, 3, 2][section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 2 {
            return 55 + 10
        }
        return [180, 55 + SEPARATOR_HEIGHT, 55 + SEPARATOR_HEIGHT][indexPath.section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "\(LeftUserHeadCell.self)", for: indexPath)
                return cell
            }
            return UITableViewCell()
        } else if indexPath.section == 1 {
            if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "\(LeftNotifictionCell.self)", for: indexPath) as! LeftNotifictionCell
                cell.nodeImageView.image = UIImage.imageUsedTemplateMode("ic_notifications_none")
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(LeftNodeTableViewCell.self)", for: indexPath) as! LeftNodeTableViewCell
            cell.nodeNameLabel.text = [NSLocalizedString("me"), NSLocalizedString("favorites")][indexPath.row]
            let names = ["ic_face","","ic_turned_in_not"]
            cell.nodeImageView.image = UIImage.imageUsedTemplateMode(names[indexPath.row])
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(LeftNodeTableViewCell.self)", for: indexPath) as! LeftNodeTableViewCell
        cell.nodeNameLabel.text = [NSLocalizedString("nodes"), NSLocalizedString("more")][indexPath.row]
        let names = ["ic_navigation","ic_settings_input_svideo"]
        cell.nodeImageView.image = UIImage.imageUsedTemplateMode(names[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
//                if !V2User.shareInstance.log {
//                }
            }
        }
    }

}
