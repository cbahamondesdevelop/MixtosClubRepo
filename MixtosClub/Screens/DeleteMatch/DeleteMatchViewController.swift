//
//  DeleteMatchViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 21-02-24.
//

import Foundation
import UIKit

class DeleteMatchViewController: UIViewController {
    let textAPP = TextsInTheApp()
    
    private lazy var deleteMatchView: DeleteMatchView = {
        let view = DeleteMatchView(viewModel: "text")
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
    }
    
    func showAlert() {
        let alert = UIAlertController(title: textAPP.titleAlert, message: textAPP.alertContent, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: textAPP.iAgree, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
}

extension DeleteMatchViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(deleteMatchView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            deleteMatchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            deleteMatchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            deleteMatchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            deleteMatchView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
