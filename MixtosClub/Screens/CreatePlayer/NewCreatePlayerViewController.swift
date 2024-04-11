//
//  CreatePlayerViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 09-03-24.
//

import Foundation
import UIKit

class NewCreatePlayerViewController: UIViewController {
    let textAPP = TextsInTheApp()
    
    private lazy var createPlayerView: CreatePlayerView = {
        let view = CreatePlayerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
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

extension NewCreatePlayerViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(createPlayerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            createPlayerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            createPlayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            createPlayerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            createPlayerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension NewCreatePlayerViewController: CreatePlayerViewDelegate {
    func tapSavePlayer() {
        self.navigationController?.popViewController(animated: true)
    }
}
