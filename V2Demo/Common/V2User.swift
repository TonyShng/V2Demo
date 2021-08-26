//
//  V2User.swift
//  V2Demo
//
//  Created by a on 2021/8/26.
//

import UIKit
import Alamofire
import Ji

let kUserName = "me.fin.username"

class V2User: NSObject {
    static let shareInstance = V2User()
    
    // 用户信息
    private var _user: UserModel?
    var user: UserModel? {
        get {
            return self._user
        }
        set {
            // 保证给 user 赋值是在主线程进行的 因为有很多 UI 可能会监听这个属性，当这个属性发生改变时，UI 也会随之调整，所以需要在主线程操作
            if Thread.isMainThread {
                self._user = newValue
                self.username = newValue?.username
            } else {
                DispatchQueue.main.sync {
                    self._user = newValue
                    self.username = newValue?.username
                }
            }
        }
    }
    
    @objc dynamic var username: String?
    
    
    /// 通知数量
    @objc dynamic var notificationCount:Int = 0
    
}
