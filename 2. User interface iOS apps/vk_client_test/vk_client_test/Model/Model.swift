//
//  Model.swift
//  vk_client_test
//
//  Created by admin on 18.08.2022.
//

import Foundation
import UIKit

class Model {
    //MARK: - Fields
    var user = VKUser()
    var groups = [VKGroup]()
    
    //MARK: - Shared
    public static var shared = Model.createTestModel()
    
    //MARK: - Methods
    static func createTestModel() -> Model {
        let m = Model()
        
        // Users
        let user_frank = Model.createUser("Френк", "Андервуд", "frank_avatar")
        let user_clare = Model.createUser("Клер", "Андервуд", "clare_avatar")
        let user_zoe = Model.createUser("Зои", "Барнс", "zoe_avatar")
        
        // Photos
        user_frank.photos = [ "frank1", "frank2", "frank3" ]
        user_clare.photos = [ "clare1", "clare2", "clare3" ]
        user_zoe.photos = [ "zoe1", "zoe2", "zoe3" ]
        
        // Friends
        user_frank.friends = [
            user_clare,
            user_zoe
        ]
        /*user_clare.friends = [
            user_frank
        ]
        user_zoe.friends = [
            user_frank
        ]*/
        
        // Groups
        let group_house = Model.createGroup("House of Card", "Serial since 2017", "g_house")
        let group_prekoler = Model.createGroup("Prekoler", "Nise comix of Narrov", "g_prekoler")
        let group_friends = Model.createGroup("Friends", "A global group for friends", nil)
        let group_1 = Model.createGroup("Friends 1", "A global group for friends", nil)
        let group_2 = Model.createGroup("Friends 2", "A global group for friends", nil)
        let group_3 = Model.createGroup("Friends 3", "A global group for friends", nil)
        
        // Model
        m.user = user_frank
        m.user.groups = [
            group_house, group_friends, group_prekoler
        ]
        m.groups = [
            group_house, group_prekoler, group_friends, group_1, group_2, group_3
        ]
        return m
    }
    
    private static func createUser(_ name: String, _ sirname: String, _ avatar: String?) -> VKUser {
        let u = VKUser()
        u.name = name
        u.sirname = sirname
        u.avatar = avatar
        return u
    }
    
    private static func createGroup(_ name: String, _ desc: String, _ avatar: String?) -> VKGroup {
        let g = VKGroup()
        g.name = name
        g.description = desc
        g.avatar = avatar
        return g
    }
    
    
}
