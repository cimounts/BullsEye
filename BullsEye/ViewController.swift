//
//  ViewController.swift
//  BullsEye
//
//  Created by Christian Mounts on 8/13/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(){
        let alert = UIAlertController(
            title:"Hello, World",
            message: "This is my first App!",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Awesome",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated:  true, completion: nil)
    }
}

