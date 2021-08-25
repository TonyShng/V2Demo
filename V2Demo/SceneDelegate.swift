//
//  SceneDelegate.swift
//  V2Demo
//
//  Created by a on 2021/8/25.
//

import UIKit
import DrawerController
import SVProgressHUD

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
//        URLProtocol.registerClass(webview)
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            V2Client.shareInstance.window = self.window
            self.window?.frame = UIScreen.main.bounds
            self.window?.makeKeyAndVisible()
        }
        
        let centerNav = V2EXNavigationController(rootViewController: HomeViewController())
        let leftViewController = LeftViewController()
        let rightViewController = RightViewController()
        let drawerController = DrawerController(centerViewController: centerNav, leftDrawerViewController: leftViewController, rightDrawerViewController: rightViewController)
        
        self.window?.themeChangedHandler = {[weak self] (style) -> Void in
            self?.window?.backgroundColor = V2EXColor.colors.v2_backgroundColor;
            drawerController.view.backgroundColor = V2EXColor.colors.v2_backgroundColor
        }
        
        drawerController.maximumLeftDrawerWidth = 230
        drawerController.maximumRightDrawerWidth = rightViewController.maximumRightDrawerWidth()
        drawerController.openDrawerGestureModeMask = OpenDrawerGestureMode.panningCenterView
        drawerController.closeDrawerGestureModeMask = CloseDrawerGestureMode.all
        self.window?.rootViewController = drawerController
        
        V2Client.shareInstance.drawerController = drawerController
        V2Client.shareInstance.centerViewController = centerNav.viewControllers[0] as? HomeViewController
        V2Client.shareInstance.centerNavigation = centerNav
        
        #if DEBUG
            let fpsLabel = V2FPSLabel(frame: CGRect(x: 15, y: SCREEN_HEIGHT - 40, width: 55, height: 20))
            self.window?.addSubview(fpsLabel)
        #else
        #endif
        
        SVProgressHUD.setForegroundColor(UIColor(white: 1, alpha: 1))
        SVProgressHUD.setBackgroundColor(UIColor(white: 0.15, alpha: 0.85))
        SVProgressHUD.setDefaultMaskType(.none)
        SVProgressHUD.setMinimumDismissTimeInterval(1.5)
        SVProgressHUD.setContainerView(self.window)
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

class V2Window: UIWindow {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if UIApplication.shared.applicationState == .active {
            V2EXColor.sharedInstance.refreshStyleIfNeeded()
        }
    }
}
