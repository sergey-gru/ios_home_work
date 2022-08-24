//
//  User.swift
//  vk_client_test
//
//  Created by admin on 18.08.2022.
//

import Foundation

class VKUser {
    //MARK - Fields
    var id: Int = VKUser.creteId()
    var name: String?
    var sirname: String?
    var avatar: String?
    
    //MARK: - Fields Collections
    var friends: [VKUser]? = [VKUser]()
    var photos: [String]?
    var groups: [VKGroup]?
    
    //MARK: - Static
    static var id_last: Int = 0
    static func creteId() -> Int {
        id_last += 1
        return id_last
    }
}
