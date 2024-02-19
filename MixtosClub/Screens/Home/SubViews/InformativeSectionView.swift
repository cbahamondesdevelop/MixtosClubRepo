//
//  InformativeSectionView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 12-02-24.
//

import Foundation
import UIKit

class InformativeSectionView: UIView {
    
    let textAPP = TextsInTheApp()
    
    private lazy var informativeLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.informative
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
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

extension InformativeSectionView {
    
    private func buildViewHierarchy() {
        [informativeLabel, pastMatches, finances].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            informativeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            informativeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            pastMatches.topAnchor.constraint(equalTo: informativeLabel.bottomAnchor, constant: 30),
            pastMatches.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            pastMatches.widthAnchor.constraint(equalToConstant: 110),
            pastMatches.heightAnchor.constraint(equalToConstant: 110),
            
            finances.topAnchor.constraint(equalTo: informativeLabel.bottomAnchor, constant: 30),
            finances.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            finances.widthAnchor.constraint(equalToConstant: 110),
            finances.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
}

extension InformativeSectionView {
    @objc
    func didTapPastMatches() {
        print("didTapPastMatches")
    }
    
    @objc
    func didTapFinances() {
        print("presione didTapFinances")
    }
}
