//
//  DownloadFile.swift
//  musicApp
//
//  Created by Владислав on 27.07.2021.
//

import Foundation

class DownloadFile {
    
    static let shared = DownloadFile()
    
    func downloadFile(url: URL, completion: @escaping (String?, Error?) -> Void) {
  
        let fileUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destUrl = fileUrl.appendingPathComponent(url.lastPathComponent)
        
        if FileManager().fileExists(atPath: destUrl.path) {
            print("File exists")
        } else {
            let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let task = session.dataTask(with: request) { data, response, error in
                if error == nil {
                    if let data = data {
                        if let _ = try? data.write(to: destUrl, options: Data.WritingOptions.atomic) {
                            completion(destUrl.path, error)
                        } else {
                            completion(destUrl.path, error)
                        }
                    }
                    
                    completion(destUrl.path, error)
                }
            }
            task.resume()
        }
    }
}
