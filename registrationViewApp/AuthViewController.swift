//
//  AuthViewController.swift
//  registrationViewApp
//
//  Created by Arslan Abdullaev on 15.12.2021.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
    }
    
    @IBAction func hideScreen() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
