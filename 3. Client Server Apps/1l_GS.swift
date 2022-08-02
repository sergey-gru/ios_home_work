/*
 1. Добавить в проект синглтон для хранения данных о текущей сессии – Session.
 2. Добавить в него свойства:
 token: String – для хранения токена в VK,
 userId: Int – для хранения идентификатора пользователя ВК.
 */

import Foundation

class Session {
    
    var token = ""
    var userId: Int = 0
    
    static var shared = Session()
    private init() { }
    
    func loadData() {
        self.token = "MyToken"
        self.userId = 326
    }
    
}



Session.shared.loadData()

print(Session.shared.token)

