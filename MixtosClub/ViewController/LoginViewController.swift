//
//  ViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 18-10-23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var loginButtonControl: UIButton!
    
    private var passwordOK = false
    private var userOK = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableButton()
    }
    
    private func disableButton() {
        loginButtonControl.isEnabled = false
        loginButtonControl.backgroundColor = .gray
    }
    
    private func enabledButton() {
        loginButtonControl.isEnabled = true
        loginButtonControl.backgroundColor = .systemMint
    }
    
    func validateSubmit() -> Void{
        if(userOK && passwordOK){
            enabledButton()
        } else {
            disableButton()
        }
    }
    @IBAction func userChange(_ sender: Any) {
        guard let user = userTextField else { return }
        if user.text != String() {
            userOK = true
        } else {
            userOK = false
        }
        validateSubmit()
    }
    
    @IBAction func passwordChange(_ sender: Any) {
        guard let pass = passwordTextField else { return }
        if pass.text != String() {
            passwordOK = true
        } else {
            passwordOK = false
        }
        validateSubmit()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let user = userTextField else { return }
        guard let pass = passwordTextField else { return }
        
        if user.text == "Cristian" && pass.text == "pass1" {
            let alert = UIAlertController(title: "Login", message: "\(user.text ?? String()), bienvenido a nuestra app", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Vale" , style: .default, handler: { action in
                switch action.style{
                    case .default:
                    self.performSegue(withIdentifier: "segueToHome", sender: user.text)
                    
                    case .cancel:
                        print("")
                        
                    case .destructive:
                        print("")
                        
                    @unknown default:
                        print("")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Login", message: "No hay registro con este usuario y contraseña", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Entendido" , style: .default, handler: { action in
                switch action.style{
                    
                    case .default:
                        print("")
                    
                    case .cancel:
                        print("")
                        
                    case .destructive:
                        print("")
                        
                    @unknown default:
                        print("")
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
