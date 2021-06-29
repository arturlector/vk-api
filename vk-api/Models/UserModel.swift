//
//  UserModel.swift
//  vk-api
//
//  Created by Artur Igberdin on 29.06.2021.
//

import Foundation
import DynamicJSON

class UserModel: BaseObject {
    
    @objc dynamic var userId: String?
    @objc dynamic var lastName: String?
    @objc dynamic var firstName: String?
    @objc dynamic var photo100: String?
    @objc dynamic var photo50: String?
   
    
    convenience required init(data: JSON) {
        self.init()
        
        self.userId = data.id.string
        self.lastName = data.last_name.string
        self.firstName = data.first_name.string
        self.photo100 = data.photo_100.string
        self.photo50 = data.photo_50.string
    }
}
