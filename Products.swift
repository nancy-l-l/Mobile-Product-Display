//
//  Products.swift
//  AiRLITZ
//
//  Created by Nancy Liddle on 8/21/24.
//

import Foundation
import UIKit
import Combine
import SwiftUI

//Essentially same functionality as API file
//JSON response from API activated by user clicking on image requires different object
class productURL : Codable{
    var image_url : String
    var image_key : String

    init (url: String, key: String){
         self.image_url = url;
         self.image_key = key;
    }
}

class product{
    func fetchh(url: String, completion: @escaping ([productURL]) -> Void){
        // Declare an empty array to hold the result
        var r:[productURL] = []
        // Create the URL object
        guard let encodedURLString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedURLString) else {
            print("Error: Invalid URL")
            completion(r)
            return
        }
        // Create the request object using the URL object
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Add headers
        request.addValue("tbQi8j0aRxa0XkiVkMx7D4w5GY91rusl2HqWwanE", forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(r)
                return
            }
                if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: String]] {
                    for item in responseJSON{
                         if  let imageUrl = item["image_url"],
                             let imageKey = item["image_key"] {
                             let current = productURL(url: imageUrl, key: imageKey)
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
