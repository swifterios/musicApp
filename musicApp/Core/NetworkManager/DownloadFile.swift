//
//  DownloadFile.swift
//  musicApp
//
//  Created by Владислав on 27.07.2021.
//

import Foundation

class DownloadFile {
    
    static let shared = DownloadFile()
    
    func downloadFile(url: URL, completion: @escaping (URL?, Error?) -> Void) {
        let tableViewCell = MusicTableViewCell()
        let session = URLSession(configuration: .default, delegate: tableViewCell.self, delegateQueue: .main)
        let task = session.downloadTask(with: url)
        task.resume()
    }
    
    
}
