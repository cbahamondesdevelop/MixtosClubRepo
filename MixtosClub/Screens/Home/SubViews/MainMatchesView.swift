//
//  MainMatchesView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 12-02-24.
//

import Foundation
import UIKit

protocol MainMatchesViewDelegate: AnyObject {
    func tapFirstMatch()
    func tapSecondMatch()
}

class MainMatchesView: UIView {
    
    let textAPP = TextsInTheApp()
    private let viewModel: ActiveMatchesModel
    weak var delegate: MainMatchesViewDelegate?
    
    private lazy var activeMatchesLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.activeMatches
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var firstMatch: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "calendar"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = viewModel.date1
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
        label.text = viewModel.date2
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSecondMatch), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: ActiveMatchesModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainMatchesView {
    
    private func buildViewHierarchy() {
        [activeMatchesLabel, firstMatch, secondMatch].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            activeMatchesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            activeMatchesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            firstMatch.topAnchor.constraint(equalTo: activeMatchesLabel.bottomAnchor, constant: 30),
            firstMatch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            firstMatch.widthAnchor.constraint(equalToConstant: 110),
            firstMatch.heightAnchor.constraint(equalToConstant: 110),
            
            secondMatch.topAnchor.constraint(equalTo: activeMatchesLabel.bottomAnchor, constant: 30),
            secondMatch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            secondMatch.widthAnchor.constraint(equalToConstant: 110),
            secondMatch.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
}

extension MainMatchesView {
    @objc
    func didTapFirstMatch() {
        delegate?.tapFirstMatch()
    }
    
    @objc
    func didTapSecondMatch() {
        delegate?.tapSecondMatch()
    }
}
