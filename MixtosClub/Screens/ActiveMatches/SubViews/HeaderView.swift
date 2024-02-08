//
//  HeaderView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 07-02-24.
//

import Foundation
import UIKit

protocol HeaderViewDelegate: AnyObject {
    func seeTeams()
}

class HeaderView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: HeaderViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "27 Febrero"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var participateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.participate, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapParticipate), for: .touchUpInside)
        return button
    }()
    
    private lazy var seeTeamsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.seeTeams, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSeeTeams), for: .touchUpInside)
        return button
    }()
    
    private lazy var iPreferNotToParticipateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        button.setTitle(textAPP.iPreferNotToParticipate, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapiPreferNotToParticipate), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    
    private func buildViewHierarchy() {
        [titleLabel, participateButton, seeTeamsButton, iPreferNotToParticipateButton].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            participateButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            participateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            participateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            participateButton.heightAnchor.constraint(equalToConstant: 40),
            
            seeTeamsButton.topAnchor.constraint(equalTo: participateButton.bottomAnchor, constant: 20),
            seeTeamsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            seeTeamsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            seeTeamsButton.heightAnchor.constraint(equalToConstant: 40),
            
            iPreferNotToParticipateButton.topAnchor.constraint(equalTo: seeTeamsButton.bottomAnchor, constant: 20),
            iPreferNotToParticipateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iPreferNotToParticipateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            iPreferNotToParticipateButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension HeaderView {
    
    @objc
    private func didTapParticipate() {
        
    }
    
    @objc
    private func didTapSeeTeams() {
        delegate?.seeTeams()
    }
    
    @objc
    private func didTapiPreferNotToParticipate() {
        
    }
}
