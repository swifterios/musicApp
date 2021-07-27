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
    
    
    //MARK: - TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filesData?.embedded.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: "musicTableViewCell", for: indexPath) as! MusicTableViewCell
        
        cell.musicLabel.text = filesData?.embedded.items[indexPath.row].name
        
        return cell
    }
}

