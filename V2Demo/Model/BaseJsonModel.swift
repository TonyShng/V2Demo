//
//  BaseJsonModel.swift
//  V2Demo
//
//  Created by a on 2021/8/26.
//

import UIKit
import ObjectMapper
import Ji
import Moya

class BaseJsonModel: Mappable {
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
    }
}

protocol BaseHtmlModelProtocol {
    init(rootNode: JiNode)
}

// 实现这个协议的类，可用于 Moya 自动解析出这个类的 model 的对象数组
protocol HtmlModelArrayProtocol {
    static func createModelArray(ji: Ji) -> [Any]
}

// 实现这个协议的类，可用于 Moya 自动解析出这个类的 model 的对象
protocol HtmlModelProtocol {
    static func createModel(ji: Ji) -> Any
}
