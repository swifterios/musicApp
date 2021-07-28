//
//  DownloadFile.swift
//  musicApp
//
//  Created by Владислав on 27.07.2021.
//

import Foundation

class DownloadFile: MusicTableViewCell, URLSessionDownloadDelegate {
    
    static let shared = DownloadFile()
    
    func downloadFile(url: URL, completion: @escaping (URL?, Error?) -> Void) {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        let task = session.downloadTask(with: url)
        task.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        
        
    }
}
