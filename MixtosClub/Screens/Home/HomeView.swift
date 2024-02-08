//
//  HomeView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 06-02-24.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    func tapFirstMatch()
}

class HomeView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: HomeViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.titleHome
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var firstMatch: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "calendar"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = "7 Feb"
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapFirstMatch), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondMatch: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "calendar"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = "10 Feb"
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSecondMatch), for: .touchUpInside)
        return button
    }()
    
    private lazy var thirdMatch: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "calendar"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = "15 Marz"
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapThirdMatch), for: .touchUpInside)
        return button
    }()
    
    private lazy var pastMatches: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "pasado"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = "Historial"
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapPastMatches), for: .touchUpInside)
        return button
    }()
    
    private lazy var finances: UIButton = {
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
        button.addTarget(self, action: #selector(didTapFinances), for: .touchUpInside)
        return button
    }()
    
    private lazy var adminPanel: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "admin2"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = "Admin"
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapAdminPanel), for: .touchUpInside)
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

extension HomeView {
    
    private func buildViewHierarchy() {
        [titleLabel, firstMatch, secondMatch, thirdMatch, pastMatches, finances, adminPanel].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            firstMatch.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            firstMatch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            firstMatch.widthAnchor.constraint(equalToConstant: 110),
            firstMatch.heightAnchor.constraint(equalToConstant: 110),
            
            secondMatch.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            secondMatch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            secondMatch.widthAnchor.constraint(equalToConstant: 110),
            secondMatch.heightAnchor.constraint(equalToConstant: 110),
            
            thirdMatch.topAnchor.constraint(equalTo: firstMatch.bottomAnchor, constant: 30),
            thirdMatch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            thirdMatch.widthAnchor.constraint(equalToConstant: 110),
            thirdMatch.heightAnchor.constraint(equalToConstant: 110),
            
            pastMatches.topAnchor.constraint(equalTo: secondMatch.bottomAnchor, constant: 30),
            pastMatches.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            pastMatches.widthAnchor.constraint(equalToConstant: 110),
            pastMatches.heightAnchor.constraint(equalToConstant: 110),
            
            finances.topAnchor.constraint(equalTo: thirdMatch.bottomAnchor, constant: 30),
            finances.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            finances.widthAnchor.constraint(equalToConstant: 110),
            finances.heightAnchor.constraint(equalToConstant: 110),
            
            adminPanel.topAnchor.constraint(equalTo: pastMatches.bottomAnchor, constant: 30),
            adminPanel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            adminPanel.widthAnchor.constraint(equalToConstant: 110),
            adminPanel.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
}

extension HomeView {
    
    @objc
    func didTapFirstMatch() {
        delegate?.tapFirstMatch()
    }
    
    @objc
    func didTapSecondMatch() {
        print("presione boton 2")
    }
    
    @objc
    func didTapThirdMatch() {
        print("presione boton 3")
    }
    
    @objc
    func didTapPastMatches() {
        print("presione boton 4")
    }
    
    @objc
    func didTapFinances() {
        print("presione boton 5")
    }
    
    @objc
    func didTapAdminPanel() {
        print("presione boton 6")
    }
}
