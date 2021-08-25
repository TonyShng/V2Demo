//
//  HomeViewController.swift
//  V2Demo
//
//  Created by a on 2021/8/25.
//

import UIKit
import SnapKit

let kHomeTab = "me.fin.homeTab"

class HomeViewController: UIViewController {
    
    var topicList: [TopicListModel] = []
    var tab:String? = nil {
        didSet {
            var name = "全部"
            for model in RightViewControllerRightNodes {
                if model.nodeName == tab{
                    name = model.nodeName ?? ""
                    break
                }
            }
            self.title = name
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
    }

}
