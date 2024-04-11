//
//  MakeMatchViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 20-02-24.
//

import Foundation
import UIKit

class MakeMatchViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    
    private lazy var makeMatchView: MakeMatchView = {
        let view = MakeMatchView()
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

extension MakeMatchViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(makeMatchView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            makeMatchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            makeMatchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            makeMatchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            makeMatchView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MakeMatchViewController: MakeMatchViewDelegate {
    func tapSavePlace() {
        print("save place")
    }
    
    func tapSaveTime(setSwitch: Bool) {
        if setSwitch {
            UserDefaults.standard.set(true, forKey: "saveTime")
        } else {
            UserDefaults.standard.set(false, forKey: "saveTime")
        }
    }
    
    func tapSavePrice() {
        print("save price")
    }
    
    func tapMakeMatch() {
        self.navigationController?.popViewController(animated: true)
    }
}

