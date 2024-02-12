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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var passwordOK = false
    private var userOK = false
    private var infoUser: Players?
    private var navigation: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableButton()
        getData()
    }
    
    private func getData() {
        activityIndicator.startAnimating()
        Provider.shared.getUsers { user in
            self.infoUser = user
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.stopAnimating()
        } failure: { error in
            print(error as Any)
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func disableButton() {
        loginButtonControl.isEnabled = false
        loginButtonControl.backgroundColor = .gray
    }
    
    private func enabledButton() {
        loginButtonControl.isEnabled = true
        //loginButtonControl.backgroundColor = .systemMint
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
        
        //if user.text == infoUser?.rut && pass.text == infoUser?.password {
        if true {
            let alert = UIAlertController(title: "Login", message: "\(infoUser?.nombre ?? String()), bienvenido a nuestra app", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Vale" , style: .default, handler: { action in
                switch action.style{
                    case .default:
                    
                    Player.shared.nombre = self.infoUser?.nombre ?? "Cristian"
                    Player.shared.apellido = self.infoUser?.apellido ?? "Bahamondes"
                    Player.shared.password = self.infoUser?.password ?? "123456"
                    Player.shared.rut = self.infoUser?.rut ?? "173558309"
                    Player.shared.email = self.infoUser?.email ?? "cristian@bhm.cl"
                    Player.shared.genero = self.infoUser?.genero ?? "Masculino"
                    Player.shared.perfil = self.infoUser?.perfil ?? "Admin"
                    Player.shared.telefono = self.infoUser?.telefono ?? "123456"
                    
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
