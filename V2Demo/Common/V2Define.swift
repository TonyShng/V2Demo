//
//  V2Define.swift
//  V2Demo
//
//  Created by a on 2021/8/25.
//

import Foundation
import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

//站点地址,客户端只有https,禁用http
let V2EXURL = "https://www.v2ex.com/"

let SEPARATOR_HEIGHT = 1.0 / UIScreen.main.scale

func NSLocalizedString(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}


func v2Font(_ fontSize: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize)
}


