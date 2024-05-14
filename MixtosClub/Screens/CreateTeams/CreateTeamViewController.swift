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
    let people: [Players]
    
    private lazy var createTeamView: CreateTeamView = {
        let view = CreateTeamView(people: people, dateOfMatch: "15 Abril")
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
    
    init(people: [Players]) {
        self.people = people
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

extension CreateTeamViewController: CreateTeamViewDelegate {
    func didTapSave() {
        self.navigationController?.popViewController(animated: true)
    }
}

