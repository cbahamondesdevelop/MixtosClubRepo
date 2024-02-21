//
//  FirstAdminPanelView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 19-02-24.
//

import Foundation
import UIKit

protocol FirstAdminPanelViewDelegate: AnyObject {
    func createTeam()
    func makeMatch()
}

class FirstAdminPanelView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: FirstAdminPanelViewDelegate?
    
    private lazy var matchesOptionsLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.matchesOptions
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var makeMatch: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "balontuerca"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = textAPP.matches
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapMakeMatch), for: .touchUpInside)
        return button
    }()
    
    private lazy var createTeam: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "equipo"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = textAPP.matches
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapCreateTeam), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirstAdminPanelView {
    
    private func buildViewHierarchy() {
        [matchesOptionsLabel, makeMatch, createTeam].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            matchesOptionsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            matchesOptionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            makeMatch.topAnchor.constraint(equalTo: matchesOptionsLabel.bottomAnchor, constant: 30),
            makeMatch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            makeMatch.widthAnchor.constraint(equalToConstant: 110),
            makeMatch.heightAnchor.constraint(equalToConstant: 110),
            
            createTeam.topAnchor.constraint(equalTo: matchesOptionsLabel.bottomAnchor, constant: 30),
            createTeam.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            createTeam.widthAnchor.constraint(equalToConstant: 110),
            createTeam.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
}

extension FirstAdminPanelView {
    @objc
    func didTapMakeMatch() {
        delegate?.makeMatch()
    }
    
    @objc
    func didTapCreateTeam() {
        delegate?.createTeam()
    }
}
