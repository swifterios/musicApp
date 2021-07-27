//
//  ViewController.swift
//  musicApp
//
//  Created by Владислав on 26.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        test()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func test() {
        ApiService.shared.getFiles { [weak self] file in
            
        }
    }
}

