//
//  createDeleteMatchViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 21-02-24.
//

import Foundation
import UIKit

class CreateDeleteMatchViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    
    private lazy var createDeleteView: CreateDeleteMatchView = {
        let view = CreateDeleteMatchView()
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
    }
    
    func showAlert() {
        let alert = UIAlertController(title: textAPP.titleAlert, message: textAPP.alertContent, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: textAPP.iAgree, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
}

extension CreateDeleteMatchViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(createDeleteView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            createDeleteView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            createDeleteView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            createDeleteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            createDeleteView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CreateDeleteMatchViewController: CreateDeleteMatchViewDelegate {
    func createMatch() {
        let controller = MakeMatchViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func deleteMatch() {
        let controller = DeleteMatchViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
