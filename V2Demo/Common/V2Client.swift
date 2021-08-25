//
//  V2Client.swift
//  V2Demo
//
//  Created by a on 2021/8/25.
//

import UIKit
import DrawerController

class V2Client: NSObject {
    static let shareInstance = V2Client()
    
    var window : UIWindow?  = nil
    
    var drawerController : DrawerController? = nil
    var centerViewController : HomeViewController? = nil
    var centerNavigation : V2EXNavigationController? = nil
    
    var topNavigationController : UINavigationController{
        get{
            return V2Client.getTopNavigationController(V2Client.shareInstance.centerNavigation!)
        }
    }
    
    fileprivate class func getTopNavigationController(_ currentNavigationController:UINavigationController) -> UINavigationController {
        if let topNav = currentNavigationController.visibleViewController?.navigationController {
            if topNav != currentNavigationController && topNav.isKind(of: UINavigationController.self) {
                return getTopNavigationController(topNav)
            }
        }
        return currentNavigationController
    }
    
    
    
    

}
