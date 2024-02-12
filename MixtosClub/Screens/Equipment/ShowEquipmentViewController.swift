//
//  ShowEquipmentViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 08-02-24.
//

import Foundation
import UIKit

class ShowEquipmentViewController: UIViewController {
    let textAPP = TextsInTheApp()
    
    private lazy var showEquipmentView: ShowEquipmentView = {
        let view = ShowEquipmentView(viewModel: "text")
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

extension ShowEquipmentViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(showEquipmentView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            showEquipmentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            showEquipmentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            showEquipmentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            showEquipmentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
