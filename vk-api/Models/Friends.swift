//
//  Friends.swift
//  vk-api
//
//  Created by Artur Igberdin on 22.06.2021.
//

import Foundation
import RealmSwift

// MARK: - Friends
struct Friends: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [User]
}

// MARK: - Item
class User: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var lastName, trackCode, firstName: String?
    @objc dynamic var photo100: String?
    //@objc dynamic var deactivated: Deactivated?

    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case trackCode = "track_code"
        case firstName = "first_name"
        case photo100 = "photo_100"
        //case deactivated
    }
}

//enum Deactivated: String, Codable {
//    case banned = "banned"
//    case deleted = "deleted"
//}
