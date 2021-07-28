//
//  MusicViewController.swift
//  musicApp
//
//  Created by Владислав on 26.07.2021.
//

import UIKit

class MusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var filesData: File?

    //MARK: - Outlets

    @IBOutlet weak var musicTableView: UITableView!
    @IBOutlet weak var musicTableViewCell: MusicTableViewCell!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getFiles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicTableView.delegate = self
        musicTableView.dataSource = self
    }
    
    //MARK: - Other functions
    
    func getFiles() {
        ApiService.shared.getFiles { [weak self] files in
            self?.filesData = files
            self?.updateTableView()
        }
    }
    
    func updateTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.musicTableView.reloadData()
        }
    }
    
    func updateProgressBar(progress: Float) {
        musicTableViewCell.updateProgressBar(progress: progress)
    }
    
    
    //MARK: - TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filesData?.embedded.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = musicTableView.dequeueReusableCell(withIdentifier: "musicTableViewCell", for: indexPath) as? MusicTableViewCell {
            
            cell.filesData = filesData
            cell.updateCell(index: indexPath.row)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    //MARK: - Actions
    

    @IBAction func startDownload(_ sender: UIButton) {
        let url = URL(string: (filesData?.embedded.items[0].file!)!)
        DownloadFile.shared.downloadFile(url: url!) { result, error in
            
        }
    }
}

