//
//  BaseObject.swift
//  vk-api
//
//  Created by Artur Igberdin on 29.06.2021.
//

import RealmSwift
import DynamicJSON

public class BaseObject: Object {
    
    convenience required init(data: JSON) {
        self.init()
    }
}
