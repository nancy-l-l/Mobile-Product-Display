//
//  API.swift
//  AiRLITZ
//
//  Created by Nancy Liddle on 7/15/24.
//

import Foundation
import UIKit
import Combine
import SwiftUI

class imageURL : Codable{
    //creating object for JSON response
    var name : String
    var image_url : String
    var image_key : String

    init (show: String, url: String, key: String){
         self.name = show;
         self.image_url = url;
         self.image_key = key;
    }
}

class Call{
    func fetch(url: String, completion: @escaping ([imageURL]) -> Void){
        // Declare an empty array to hold the result
        var r:[imageURL] = []
        
        //turns string parameter into URL object
        //function terminates if URL conversion fails
        guard let url = URL(string: url) else {
                    completion(r)
                    return
                }
        
        // Create the request object using the URL object
        var request = URLRequest(url: url)
        //type of HTTP request
        request.httpMethod = "GET"
        
        //headers for request
        request.addValue("tbQi8j0aRxa0XkiVkMx7D4w5GY91rusl2HqWwanE", forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        //sends http request to API and checks a valid response is returned.
        //function terminates if nothing is returned
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(r)
                return
            }
            //if http request was successful, r is populated with each object in JSON response
                if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: String]] {
                    for item in responseJSON{
                        //turns each object from JSON into an imageURL object
                        if let showName = item["show_name"],
                           let imageUrl = item["image_url"],
                           let imageKey = item["image_key"] {
                            let current = imageURL(show: showName, url: imageUrl, key: imageKey)
                            r.append(current)
                        }
                    }
                    completion(r)
                }else {
                    print("JSON is invalid")
                    completion(r)
                }
        }
        dataTask.resume()
    }
        
}
