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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mainVc = segue.destination as! ViewController
        nameLabel.text = mainVc.nameTF.text
    }
    
   
    @IBAction func hideScreen() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
