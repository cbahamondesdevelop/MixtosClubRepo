//
//  SecondAdminPanelView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 20-02-24.
//

import Foundation
import UIKit

class SecondAdminPanelView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: FirstAdminPanelViewDelegate?
    
    private lazy var otherOptionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Otras configuraciones"//textAPP.activeMatches
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var players: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "player"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = "Jugador"
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapPlayers), for: .touchUpInside)
        return button
    }()
    
    private lazy var finance: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "finanzas"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = "Finanzas"
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapFinance), for: .touchUpInside)
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

extension SecondAdminPanelView {
    
    private func buildViewHierarchy() {
        [otherOptionsLabel, players, finance].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            otherOptionsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            otherOptionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            players.topAnchor.constraint(equalTo: otherOptionsLabel.bottomAnchor, constant: 30),
            players.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            players.widthAnchor.constraint(equalToConstant: 110),
            players.heightAnchor.constraint(equalToConstant: 110),
            
            finance.topAnchor.constraint(equalTo: otherOptionsLabel.bottomAnchor, constant: 30),
            finance.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            finance.widthAnchor.constraint(equalToConstant: 110),
            finance.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
}

extension SecondAdminPanelView {
    @objc
    func didTapPlayers() {
        print("presione crear partido")
        delegate?.makeMatch()
    }
    
    @objc
    func didTapFinance() {
        print("presione crear equipo")
        delegate?.createTeam()
    }
}
