//
//  LoginViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 06-02-24.
//

import Foundation
import UIKit

class NewLoginViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    //let provider = Provider(initialDate: "2023-01-01", finalDate: "2023-01-02")
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
        overrideUserInterfaceStyle = .light
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(myDismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func makeLogin(user: String, password: String) {
        let fakeUser = "Cristian"
        let fakePass = "1234"
        
        if user == fakeUser && password == fakePass {
            /*
            provider.fetchDataFromAPI { result in
                switch result {
                case .success(let response):
                    let controller = HomeViewController(viewModel: response)
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller, animated: true)
                case .failure(let error):
                    print("error \(error)")
                }
            }*/
            
        } else {
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: textAPP.titleAlert, message: textAPP.alertContent, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: textAPP.iAgree, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
    
    @objc
    func myDismissKeyboard() {
        view.endEditing(true)
    }
}

extension NewLoginViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(loginView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension NewLoginViewController: LoginDelegate {
    func didTapCreateAccount() {
        //let controller = RegisterUserViewController()
        //navigationController?.pushViewController(controller, animated: true)
    }
    
    func didTapLoginContinue(user: String, pass: String) {
        //makeLogin(user: user, password: pass)
        let controller = NewHomeViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
