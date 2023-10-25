//
//  CreatePlayerViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 23-10-23.
//

import UIKit

class CreatePlayerViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.text = createPasswordRandom()
    }
    
    @IBAction func tapCreatePlayer(_ sender: Any) {
    }
    
    func createPasswordRandom() -> String {
        let pass = Int.random(in: 1...10000000)
        let strPass = String(pass)
        return strPass
    }
    
}
