//
//  APIService.swift
//  vk-api
//
//  Created by Artur Igberdin on 22.06.2021.
//

import Foundation
import Alamofire

final class APIService {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.21"
    
    
    func getFriendsQuicktype(completion: @escaping([User])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": cliendId,
            "order": "name",
            "count": 100,
            "fields": "photo_100",
            "access_token": Session.shared.token,
            "v": version]
        
        let url = baseUrl + method
        

        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.data else { return }
            print(data.prettyJSON)
            
            let friendsResponse = try? JSONDecoder().decode(Friends.self, from: data)
            
            guard let friends = friendsResponse?.response.items else { return }
            
            DispatchQueue.main.async {
                completion(friends)
            }
        }
    }
    
    func getFriendsManual(completion: ([User])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": cliendId,
            "order": "name",
            "count": 100,
            "fields": "photo_100",
            "access_token": Session.shared.token,
            "v": version]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
           
            guard let data = response.data else { return }
            print(data.prettyJSON)
            
            guard let json = try? JSONSerialization.jsonObject(with: data, options:.mutableContainers) else { return }
            
            let object = json as! [String: Any]
            let response = object["response"] as! [String: Any]
            let items = response["items"] as! [Any]
            
            for userJson in items {
                let userJson  = userJson as! [String: Any]
                let id = userJson["id"] as! Int
                let lastName = userJson["last_name"] as! String
                let firstName = userJson["first_name"] as! String
                
                print(id, firstName, lastName)
            }
        }
        
        completion([])
        
    }
    
    //
    func getGroups() {}
    
    
}
