//
//  FinanceViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 09-04-24.
//

import Foundation
import UIKit

class FinanceViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    let viewModel: FinanceModel
    
    private lazy var financeView: FinanceView = {
        let view = FinanceView(viewModel: viewModel)
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
    
    init(viewModel: FinanceModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FinanceViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(financeView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            financeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            financeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            financeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            financeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FinanceViewController: FinanceViewDelegate {
    func didTapSubtract(numberParam: Int) -> Int {
        var numberReturn = numberParam
        numberReturn -= 1
        if numberReturn < 0 {
            numberReturn = 0
        }
        return numberReturn
    }
    
    func didTapAdd(numberParam: Int) -> Int {
        var numberReturn = numberParam
        numberReturn += 1
        return numberReturn
    }

    func didTapSave() {
        self.navigationController?.popViewController(animated: true)
    }
}
