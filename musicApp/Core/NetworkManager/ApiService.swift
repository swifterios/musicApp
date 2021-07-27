//
//  ApiService.swift
//  musicApp
//
//  Created by Владислав on 26.07.2021.
//

import Foundation

class ApiService {

    static let shared = ApiService()
    
    let baseUrl = "cloud-api.yandex.net"
    let scheme = "https"
    let token = "AQAAAAAw7L7sAADLW1509QGKOUj_mznqFTpzxpE"
    var components = URLComponents()
    
    func getFiles(completion: @escaping (File) -> Void) {
        
        components.scheme = scheme
        components.host = baseUrl
        components.path = ApiOperation.getFiles.path
        components.queryItems = [URLQueryItem(name: "path", value: "Music")]
        
        var request = URLRequest(url: components.url!)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let result = try? JSONDecoder().decode(File.self, from: data) {
                completion(result)
            } else {
                print(error.debugDescription)

            }
        }
        task.resume()
    }
}

enum ApiOperation {
    case getFiles
    
    var path: String {
        switch self {
        case .getFiles:
            return "/v1/disk/resources"
        }
    }
}
