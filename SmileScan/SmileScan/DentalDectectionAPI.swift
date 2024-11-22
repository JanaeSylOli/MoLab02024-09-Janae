//
//  DentalDectectionAPI.swift
//  SmileScan
//
//  Created by Janae  Sylvester Oliver on 11/22/24.
//

import UIKit
import Foundation

class DentalDetectionAPI {
    private let apiKey = "YOUR_API_KEY"
    private let modelVersion = "2"
    private let modelName = "dental-bregy"
    private let baseUrl = "https://detect.roboflow.com/"
    
    func uploadImage(image: UIImage, completion: @escaping ([String: Any]?, String?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            completion(nil, "Failed to convert image to data")
            return
        }
        
        let base64Image = imageData.base64EncodedString()
        guard let postData = base64Image.data(using: .utf8) else {
            completion(nil, "Failed to encode image to Base64")
            return
        }
        
        guard let url = URL(string: "\(baseUrl)\(modelName)/\(modelVersion)?api_key=\(apiKey)&name=YOUR_IMAGE.jpg") else {
            completion(nil, "Invalid URL")
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion(nil, "No data received")
                return
            }
            
            do {
                if let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    completion(dict, nil)
                } else {
                    completion(nil, "Failed to parse response")
                }
            } catch {
                completion(nil, error.localizedDescription)
            }
        }.resume()
    }
}
