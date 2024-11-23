//
//  FinanceView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 09-04-24.
//

import Foundation
import UIKit

protocol FinanceViewDelegate: AnyObject {
    func didTapSave()
    func didTapAdd(numberParam: Int) -> Int
    func didTapSubtract(numberParam: Int) -> Int
}

class FinanceView: UIView {
    
    let textAPP = TextsInTheApp()
    private let viewModel: FinanceModel
    weak var delegate: FinanceViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.finance
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var numberOfMatchesLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.numberOfMatches
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var numberOfMatchesTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(tapAddButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var subtractButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(tapSubtractButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var collectedMatchLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.collectedMatch
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var billsLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.bills
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var isAvailableLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.isAvailable
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var collectedMatchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var billsTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var isAvailableTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.save, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSaveMatch), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: FinanceModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildViewHierarchy()
        setupConstraints()
        setupUI()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FinanceView {
    private func setupUI() {
        
        numberOfMatchesTextField.text = String(viewModel.numberOfMatches)
        collectedMatchTextField.text = String(viewModel.collectedMatch)
        billsTextField.text = String(viewModel.bills)
        isAvailableTextField.text = String(viewModel.isAvailable)
        
        if viewModel.kindUser == kindUserType.standard.rawValue {
            numberOfMatchesTextField.isEnabled = false
            collectedMatchTextField.isEnabled = false
            billsTextField.isEnabled = false
            isAvailableTextField.isEnabled = false
        } else {
            numberOfMatchesTextField.isEnabled = true
            collectedMatchTextField.isEnabled = true
            billsTextField.isEnabled = true
            isAvailableTextField.isEnabled = false
        }
    }
    
    private func buildViewHierarchy() {
        [titleLabel,
         numberOfMatchesLabel,
         numberOfMatchesTextField,
         collectedMatchLabel,
         billsLabel,
         isAvailableLabel,
         collectedMatchTextField,
         billsTextField,
         isAvailableTextField].forEach(addSubview)
        
        if viewModel.kindUser == kindUserType.admin.rawValue {
            addSubview(addButton)
            addSubview(subtractButton)
            addSubview(saveButton)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            numberOfMatchesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            numberOfMatchesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            numberOfMatchesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            numberOfMatchesTextField.topAnchor.constraint(equalTo: numberOfMatchesLabel.bottomAnchor, constant: 20),
            numberOfMatchesTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberOfMatchesTextField.widthAnchor.constraint(equalToConstant: 110),
            
            collectedMatchLabel.topAnchor.constraint(equalTo: numberOfMatchesTextField.bottomAnchor, constant: 50),
            collectedMatchLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            billsLabel.topAnchor.constraint(equalTo: collectedMatchLabel.bottomAnchor, constant: 30),
            billsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            isAvailableLabel.topAnchor.constraint(equalTo: billsLabel.bottomAnchor, constant: 30),
            isAvailableLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            collectedMatchTextField.topAnchor.constraint(equalTo: numberOfMatchesTextField.bottomAnchor, constant: 45),
            collectedMatchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            collectedMatchTextField.widthAnchor.constraint(equalToConstant: 110),
            
            billsTextField.topAnchor.constraint(equalTo: collectedMatchTextField.bottomAnchor, constant: 18),
            billsTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            billsTextField.widthAnchor.constraint(equalToConstant: 110),
            
            isAvailableTextField.topAnchor.constraint(equalTo: billsTextField.bottomAnchor, constant: 18),
            isAvailableTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            isAvailableTextField.widthAnchor.constraint(equalToConstant: 110)
            
        ])
        
        if viewModel.kindUser == kindUserType.admin.rawValue {
            NSLayoutConstraint.activate([
                addButton.topAnchor.constraint(equalTo: numberOfMatchesLabel.bottomAnchor, constant: 30),
                addButton.leadingAnchor.constraint(equalTo: numberOfMatchesTextField.trailingAnchor, constant: 10),
                
                subtractButton.topAnchor.constraint(equalTo: numberOfMatchesLabel.bottomAnchor, constant: 30),
                subtractButton.trailingAnchor.constraint(equalTo: numberOfMatchesTextField.leadingAnchor, constant: -10),
                
                saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
                saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                saveButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    }
}

extension FinanceView {
    @objc
    func tapAddButton() {
        guard let valueOfTextField = numberOfMatchesTextField.text else { return }
        guard let number = delegate?.didTapAdd(numberParam: Int(valueOfTextField) ?? 0) else { return }
        numberOfMatchesTextField.text = String(number)
    }
    
    @objc
    func tapSubtractButton() {
        guard let valueOfTextField = numberOfMatchesTextField.text else { return }
        guard let number = delegate?.didTapSubtract(numberParam: Int(valueOfTextField) ?? 0) else { return }
        numberOfMatchesTextField.text = String(number)
    }
    
    @objc
    func didTapSaveMatch() {
        delegate?.didTapSave()
    }
}
