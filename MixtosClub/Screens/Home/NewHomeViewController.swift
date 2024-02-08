//
//  HomeViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 06-02-24.
//

import Foundation
import UIKit

class NewHomeViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    //let provider = Provider(initialDate: "2023-01-01", finalDate: "2023-01-02")
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
        overrideUserInterfaceStyle = .light
    }
    
    func showAlert() {
        let alert = UIAlertController(title: textAPP.titleAlert, message: textAPP.alertContent, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: textAPP.iAgree, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
}

extension NewHomeViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(homeView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension NewHomeViewController: HomeViewDelegate {
    func tapFirstMatch() {
        let controller = NewActiveMatchesViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
