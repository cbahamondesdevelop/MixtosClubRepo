//
//  SecondaryMatchesView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 12-02-24.
//

import Foundation
import UIKit

class SecondaryMatchesView: UIView {
    
    let textAPP = TextsInTheApp()
    
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
    
    private lazy var fourthMatch: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "calendar"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = "25 Marz"
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapFourthMatch), for: .touchUpInside)
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

extension SecondaryMatchesView {
    
    private func buildViewHierarchy() {
        [thirdMatch, fourthMatch].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            thirdMatch.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            thirdMatch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            thirdMatch.widthAnchor.constraint(equalToConstant: 110),
            thirdMatch.heightAnchor.constraint(equalToConstant: 110),
            
            fourthMatch.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            fourthMatch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            fourthMatch.widthAnchor.constraint(equalToConstant: 110),
            fourthMatch.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
}

extension SecondaryMatchesView {
    @objc
    func didTapThirdMatch() {
        print("delegate?.tapFirstMatch()")
    }
    
    @objc
    func didTapFourthMatch() {
        print("presione didTapFourthMatch")
    }
}
