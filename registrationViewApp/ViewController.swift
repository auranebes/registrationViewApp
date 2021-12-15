//
//  ViewController.swift
//  registrationViewApp
//
//  Created by Arslan Abdullaev on 15.12.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    var nameValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.text = nameValue
    }
    
  
    @IBAction func logInPressed() {
        guard let inputText = nameTF.text, !inputText.isEmpty else {
            showAlert(title: "Text field is empty",
                      message: "Plase enter your name")
            return
        }
        
        guard let inputText = passwordTF.text, !inputText.isEmpty else {
            showAlert(title: "Text field is empty",
                      message: "Plase enter your password")
            return
        }
        
        if (nameTF.text == "User") && (passwordTF.text == "qwerty") {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let authVC = storyboard.instantiateViewController(identifier: "AuthViewController")
        self.present(authVC, animated: true, completion: nil)
        } else {
            showAlert(title: "ERROR", message: "login or password incorrect")
        }
    }
        
    
    
    @IBAction func giveAName() {
        showAlert(title: "Your name is", message: "User")
        
    }
    
    @IBAction func giveAPassword() {
        showAlert(title: "Your password is", message: "qwerty")
    }
    
}


// MARK: - Private Methods
extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.nameTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
}

