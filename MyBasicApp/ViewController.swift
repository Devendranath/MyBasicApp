//
//  ViewController.swift
//  MyBasicApp
//
//  Created by apple on 28/01/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var phNoTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)        
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        phNoTF.text = ""
        pwdTF.text = ""
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let button = sender as! UIButton
        button.setTitle("Sign In", for: .normal)
        print(sender)
        var userName = phNoTF.text ?? ""
        var pwd = pwdTF.text ?? ""
        
        userName = userName.trimmingCharacters(in: CharacterSet(charactersIn: " "))
        pwd = pwd.trimmingCharacters(in: CharacterSet(charactersIn: " "))
        
        if userName.isEmpty || pwd.isEmpty {
            let alert = UIAlertController(title: "Input Error", message: "Please provide valid input!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                print("User clicked ok")
            }
            
            let retryAction = UIAlertAction(title: "Retry", style: .default) { (retry) in
                print("retry clicked!")
            }
            
            alert.addAction(okAction)
            alert.addAction(retryAction)
            self.present(alert, animated: true, completion: nil);
            print("Please provide data")
        } else {
            print(userName)
            print(pwdTF)
            print("Implemented alert for proper login details!")
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("asfsdafsdf: \(string)")
        if string == "" {
            return true
        }

        if string == "\n" {
            pwdTF.becomeFirstResponder()
        }
        
        if let text = textField.text, text.count >= 10 {
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == phNoTF {
            pwdTF.becomeFirstResponder()
        } else if textField == pwdTF {
            textField.resignFirstResponder()
        } else {
                view.endEditing(true)
        }
        return true
    }
    
    @IBAction func doneButtonClicked() {
        view.endEditing(true)
    }
}
