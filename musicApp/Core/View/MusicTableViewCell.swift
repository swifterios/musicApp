//
//  MusicTableViewCell.swift
//  musicApp
//
//  Created by Владислав on 27.07.2021.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    var filesData: File?
    var currentProgress: Float = 0.0 {
        didSet {
            self.progressBar.progress = currentProgress
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView! {
        didSet {
            progressBar.setProgress(progressBar.progress, animated: true)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        progressBar.progress = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func downloadFile(_ sender: UIButton) {
        let url = URL(string: (filesData?.embedded.items[0].file!)!)
        DownloadFile.shared.downloadFile(url: url!) { result, error in
            print(result)
        }
    }
    
    
    func updatePorgressView(progress: Float) {
        if progressBar != nil {
            self.progressBar.setProgress(progress, animated: true)
        }
    }
    
    func updateCell(index: Int) {
        musicLabel.text = filesData?.embedded.items[index].name
    }
}
