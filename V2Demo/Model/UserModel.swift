//
//  UserModel.swift
//  V2Demo
//
//  Created by a on 2021/8/26.
//

import UIKit
import ObjectMapper

class UserModel: BaseJsonModel {
    var status: String?
    var id: String?
    var url: String?
    var username: String?
    var website: String?
    var twitter: String?
    var psn: String?
    var btc: String?
    var location: String?
    var tagline: String?
    var bio: String?
    var avatar_mini: String?
    var avatar_normal: String?
    var avatar_large: String?
    var created: String?
    
    override func mapping(map: Map) {
        status <- map["status"]
        id <- map["id"]
        url <- map["url"]
        username <- map["username"]
        website <- map["website"]
        twitter <- map["twitter"]
        psn <- map["psn"]
        btc <- map["btc"]
        location <- map["location"]
        tagline <- map["tagline"]
        bio <- map["bio"]
        avatar_mini <- map["avatar_mini"]
        avatar_normal <- map["avatar_normal"]
        avatar_large <- map["avatar_large"]
        created <- map["created"]
    }
    

}
