//
//  CreateTeamViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 19-03-24.
//

import Foundation
import UIKit

class CreateTeamViewController: UIViewController {
    let textAPP = TextsInTheApp()
    
    private lazy var createTeamView: CreateTeamView = {
        let view = CreateTeamView(viewModel: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
        overrideUserInterfaceStyle = .light
        navigationController?.navigationBar.topItem?.backButtonTitle = textAPP.back
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(myDismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
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

extension CreateTeamViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(createTeamView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            createTeamView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            createTeamView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            createTeamView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            createTeamView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
/*
extension CreateTeamViewController: CreatePlayerViewDelegate {
    func tapSavePlayer() {
        self.navigationController?.popViewController(animated: true)
    }
}
*/
