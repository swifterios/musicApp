//
//  MusicTableViewCell.swift
//  musicApp
//
//  Created by Владислав on 27.07.2021.
//

import UIKit

class MusicTableViewCell: UITableViewCell, URLSessionDownloadDelegate {

    
    var filesData: File?
    
    //MARK: - Outlets
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func updateCell(index: Int) {
        musicLabel.text = filesData?.embedded.items[index].name
    }
    
    func updateProgressBar(progress: Float) {
        self.progressBar.setProgress(progress, animated: true)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesWritten)
        updateProgressBar(progress: progress)
    }

}
