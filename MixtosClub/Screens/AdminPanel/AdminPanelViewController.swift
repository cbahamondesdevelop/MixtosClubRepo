//
//  AdminPanelViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 19-02-24.
//

import Foundation
import UIKit

class AdminPanelViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    let viewModel: adminModel
    
    private lazy var adminView: AdminPanelView = {
        let view = AdminPanelView()
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
    
    init(viewModel: adminModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AdminPanelViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(adminView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            adminView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            adminView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            adminView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            adminView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension AdminPanelViewController: AdminPanelViewDelegate {
    func tapPlayers() {
        let controller = NewCreatePlayerViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tapFinance() {
        let controller = FinanceViewController(viewModel: viewModel.infoFinance)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tapCreateTeam() {
        let controller = CreateTeamViewController(people: viewModel.infoPeople)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tapMakeMatch() {
        let controller = CreateDeleteMatchViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

