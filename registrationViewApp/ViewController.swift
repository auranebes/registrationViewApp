//
//  ViewController.swift
//  registrationViewApp
//
//  Created by Arslan Abdullaev on 15.12.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  textFieldShouldReturn(nameTF)  не работает :(
      //  textFieldShouldReturn(passwordTF)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSegue" {
        let authVC = segue.destination as! AuthViewController
            authVC.name = nameTF.text
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func logInPressed() {
        guard let inputText = nameTF.text, !inputText.isEmpty else {
            
            showAlert(title: "Text field is empty",
                      message: "Please enter your name")
            return
        }
        
        guard let inputText = passwordTF.text, !inputText.isEmpty else {
            showAlert(title: "Text field is empty",
                      message: "Please enter your password")
            return
        }
        
        if (nameTF.text == "User") && (passwordTF.text == "qwerty") {
       // let storyboard = UIStoryboard(name: "Main", bundle: nil)
       // let authVC = storyboard.instantiateViewController(identifier: "AuthViewController")
        performSegue(withIdentifier: "showSegue", sender: nil)
       // self.present(authVC, animated: true, completion: nil)
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
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? AuthViewController else { return }
        nameTF.text = ""
        passwordTF.text = ""
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
    
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTF:
            passwordTF.becomeFirstResponder()
        default:
            resignFirstResponder()
        }
        return false
    }
}

