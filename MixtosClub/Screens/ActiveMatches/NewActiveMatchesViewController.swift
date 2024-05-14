//
//  NewActiveMatches.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 07-02-24.
//

import Foundation
import UIKit

class NewActiveMatchesViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    let participateModel: ParticipateModel
    
    private lazy var activeMatchesView: ActiveMatchesView = {
        let view = ActiveMatchesView(viewModel: participateModel)
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
    
    init(participateModel: ParticipateModel) {
        self.participateModel = participateModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewActiveMatchesViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(activeMatchesView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            activeMatchesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activeMatchesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activeMatchesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            activeMatchesView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension NewActiveMatchesViewController: ActiveMatchesViewDelegate {
    func participate(loggedUser: Players) {
        print("participate: \(loggedUser)")
    }
    
    func seeTeams() {
        let controller = ShowEquipmentViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
