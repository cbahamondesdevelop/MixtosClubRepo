//
//  File.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 19-02-24.
//

import Foundation
import UIKit

protocol AdminPanelViewDelegate: AnyObject {
    func tapCreateTeam()
    func tapMakeMatch()
    func tapPlayers()
    func tapFinance()
}

class AdminPanelView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: AdminPanelViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.adminPanel
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var firstView: FirstAdminPanelView = {
        let view = FirstAdminPanelView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondaryView: SecondAdminPanelView = {
        let view = SecondAdminPanelView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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

extension AdminPanelView {
    private func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(firstView)
        addSubview(secondaryView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            firstView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            firstView.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstView.heightAnchor.constraint(equalToConstant: 175),
            
            secondaryView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 10),
            secondaryView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondaryView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondaryView.heightAnchor.constraint(equalToConstant: 175),
        ])
    }
}

extension AdminPanelView: FirstAdminPanelViewDelegate {
    func createTeam() {
        delegate?.tapCreateTeam()
    }
    
    func makeMatch() {
        delegate?.tapMakeMatch()
    }
}

extension AdminPanelView: SecondAdminPanelViewDelegate {
    func tapPlayers() {
        delegate?.tapPlayers()
    }
    
    func tapFinance() {
        delegate?.tapFinance()
    }
}
