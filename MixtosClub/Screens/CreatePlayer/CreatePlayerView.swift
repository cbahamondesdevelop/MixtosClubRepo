//
//  CreatePlayerView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 09-03-24.
//

import Foundation
import UIKit

protocol CreatePlayerViewDelegate: AnyObject {
    func tapSavePlayer()
}

class CreatePlayerView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: CreatePlayerViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.createPlayer
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.infoPlayer
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.name
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()

    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.lastName
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var rutTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.rutUser
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.email
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var passTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.passUser
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var repeatPassTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.repeatPassword
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var infoGenderLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.genderPlayer
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var femaleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.female
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var maleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.male
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var femaleSwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.isOn = false
        mySwitch.addTarget(self, action: #selector(didTapFemale), for: .touchUpInside)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()
    
    private lazy var maleSwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.isOn = false
        mySwitch.addTarget(self, action: #selector(didTapMale), for: .touchUpInside)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()
    
    private lazy var createPlayerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.createPlayer, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapCreatePlayer), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
        //reviewUserDefault()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    /*
    private func reviewUserDefault() {
        let userDefaultSaveTime = UserDefaults.standard.object(forKey: "saveTime")
        print("user default: \(userDefaultSaveTime ?? "nada")")
        
        if userDefaultSaveTime as? Int == 1 {
            saveTime.isOn = true
        }
    }*/
}

extension CreatePlayerView {
    
    private func buildViewHierarchy() {
        [titleLabel, 
         infoLabel,
         nameTextField,
         lastNameTextField,
         rutTextField,
         emailTextField,
         passTextField,
         repeatPassTextField,
         infoGenderLabel,
         femaleLabel,
         maleLabel,
         femaleSwitch,
         maleSwitch,
         createPlayerButton
        ].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            nameTextField.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            lastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            lastNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lastNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            rutTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 15),
            rutTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            rutTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: rutTextField.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            repeatPassTextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 15),
            repeatPassTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            repeatPassTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            infoGenderLabel.topAnchor.constraint(equalTo: repeatPassTextField.bottomAnchor, constant: 30),
            infoGenderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            femaleLabel.topAnchor.constraint(equalTo: infoGenderLabel.bottomAnchor, constant: 30),
            femaleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            femaleLabel.widthAnchor.constraint(equalToConstant: 100),
            
            femaleSwitch.topAnchor.constraint(equalTo: infoGenderLabel.bottomAnchor, constant: 25),
            femaleSwitch.leadingAnchor.constraint(equalTo: femaleLabel.trailingAnchor, constant: 20),
            
            maleLabel.topAnchor.constraint(equalTo: femaleLabel.bottomAnchor, constant: 30),
            maleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            maleLabel.widthAnchor.constraint(equalToConstant: 100),
            
            maleSwitch.topAnchor.constraint(equalTo: femaleLabel.bottomAnchor, constant: 25),
            maleSwitch.leadingAnchor.constraint(equalTo: maleLabel.trailingAnchor, constant: 20),
            
            createPlayerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            createPlayerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            createPlayerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            createPlayerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension CreatePlayerView {
    @objc
    func didTapCreatePlayer() {
        delegate?.tapSavePlayer()
    }
    
    @objc
    func didTapFemale() {
        if maleSwitch.isOn {
            maleSwitch.isOn = false
        }
    }
    
    @objc
    func didTapMale() {
        if femaleSwitch.isOn {
            femaleSwitch.isOn = false
        }
    }
}

