//
//  MakeMatchView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 20-02-24.
//

import Foundation
import UIKit

protocol MakeMatchViewDelegate: AnyObject {
    func tapSavePlace()
    func tapSaveTime(setSwitch: Bool)
    func tapSavePrice()
    func tapMakeMatch()
}

class MakeMatchView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: MakeMatchViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.makeMatch
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.infoMakeMatch
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var saveLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.saveInfo
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var placeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.courtPlace
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var savePlace: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.isOn = false
        mySwitch.addTarget(self, action: #selector(didTapSavePlace), for: .touchUpInside)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()
    
    private lazy var dayTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.day
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var monthTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.month
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var yearTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.year
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var matchTimeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.matchTime
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var saveTime: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.isOn = false
        mySwitch.addTarget(self, action: #selector(didTapSaveTime), for: .touchUpInside)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()
    
    private lazy var priceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.price
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var savePrice: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.isOn = false
        mySwitch.addTarget(self, action: #selector(didTapSavePrice), for: .touchUpInside)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()
    
    private lazy var makeMatchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.makeMatch, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapMakeMatch), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
        reviewUserDefault()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func reviewUserDefault() {
        let userDefaultSaveTime = UserDefaults.standard.object(forKey: "saveTime")
        print("user default: \(userDefaultSaveTime ?? "nada")")
        
        if userDefaultSaveTime as? Int == 1 {
            saveTime.isOn = true
        }
    }
}

extension MakeMatchView {
    
    private func buildViewHierarchy() {
        [titleLabel, infoLabel, saveLabel, placeTextField, savePlace, dayTextField, monthTextField, yearTextField, matchTimeTextField, saveTime, priceTextField, savePrice, makeMatchButton].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            saveLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            saveLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            placeTextField.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            placeTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            placeTextField.widthAnchor.constraint(equalToConstant: 265),
            
            savePlace.topAnchor.constraint(equalTo: saveLabel.bottomAnchor, constant: 10),
            savePlace.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            dayTextField.topAnchor.constraint(equalTo: placeTextField.bottomAnchor, constant: 10),
            dayTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dayTextField.widthAnchor.constraint(equalToConstant: 80),
            
            monthTextField.topAnchor.constraint(equalTo: placeTextField.bottomAnchor, constant: 10),
            monthTextField.leadingAnchor.constraint(equalTo: dayTextField.trailingAnchor, constant: 10),
            monthTextField.trailingAnchor.constraint(equalTo: yearTextField.leadingAnchor, constant: -10),
            monthTextField.widthAnchor.constraint(equalToConstant: 80),
            
            yearTextField.topAnchor.constraint(equalTo: placeTextField.bottomAnchor, constant: 10),
            yearTextField.trailingAnchor.constraint(equalTo: placeTextField.trailingAnchor),
            yearTextField.widthAnchor.constraint(equalToConstant: 80),
            
            matchTimeTextField.topAnchor.constraint(equalTo: dayTextField.bottomAnchor, constant: 10),
            matchTimeTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            matchTimeTextField.widthAnchor.constraint(equalToConstant: 265),
            
            saveTime.topAnchor.constraint(equalTo: dayTextField.bottomAnchor, constant: 10),
            saveTime.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            priceTextField.topAnchor.constraint(equalTo: matchTimeTextField.bottomAnchor, constant: 10),
            priceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priceTextField.widthAnchor.constraint(equalToConstant: 265),
            
            savePrice.topAnchor.constraint(equalTo: matchTimeTextField.bottomAnchor, constant: 10),
            savePrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            makeMatchButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            makeMatchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            makeMatchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            makeMatchButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension MakeMatchView {
    @objc
    func didTapSavePlace() {
        delegate?.tapSavePlace()
    }
    
    @objc
    func didTapSaveTime() {
        if saveTime.isOn {
            delegate?.tapSaveTime(setSwitch: true)
        } else {
            delegate?.tapSaveTime(setSwitch: false)
        }
    }
    
    @objc
    func didTapSavePrice() {
        delegate?.tapSavePrice()
    }
    
    @objc
    func didTapMakeMatch() {
        delegate?.tapMakeMatch()
    }
}
