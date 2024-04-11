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
    let viewModel = FinanceModel(kindUser: kindUserType.standard.rawValue, numberOfMatches: 103, collectedMatch: 20, bills: 8000, isAvailable: 50000)
    
    private lazy var homeView: HomeView = {
        let view = HomeView(kindUser: kindUserType.admin.rawValue, activeSecondaryMatches: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
        overrideUserInterfaceStyle = .light
        self.navigationItem.hidesBackButton = true
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
    func goPastMatches() {
        print("go past matches")
    }
    
    func goFinance() {
        let controller = FinanceViewController(viewModel: viewModel)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func goAdminPanel() {
        let controller = AdminPanelViewController(/*viewModel: viewModel*/)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tapFirstMatch() {
        let controller = NewActiveMatchesViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
