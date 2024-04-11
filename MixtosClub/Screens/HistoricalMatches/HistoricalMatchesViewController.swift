//
//  HistoricalMatchesViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 11-04-24.
//

import Foundation
import UIKit

class HistoricalMatchesViewController: UIViewController {
    let textAPP = TextsInTheApp()
    
    private lazy var historicalMatchesView: HistoricalMatchesView = {
        let view = HistoricalMatchesView(viewModel: "")
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

extension HistoricalMatchesViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(historicalMatchesView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            historicalMatchesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            historicalMatchesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            historicalMatchesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            historicalMatchesView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

