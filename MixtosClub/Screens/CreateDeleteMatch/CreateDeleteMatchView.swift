//
//  CreateDeleteMatchView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 21-02-24.
//

import Foundation
import UIKit

protocol CreateDeleteMatchViewDelegate: AnyObject {
    func createMatch()
    func deleteMatch()
}

class CreateDeleteMatchView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: CreateDeleteMatchViewDelegate?
    
    private lazy var createDeleteLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.createDelete
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var createMatch: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "crear"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = textAPP.create
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapCreateMatch), for: .touchUpInside)
        return button
    }()
    
    private lazy var deleteMatch: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "eliminar"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = textAPP.delete
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapDeleteMatch), for: .touchUpInside)
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

extension CreateDeleteMatchView {
    
    private func buildViewHierarchy() {
        [createDeleteLabel, createMatch, deleteMatch].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            createDeleteLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            createDeleteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            createDeleteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            createMatch.topAnchor.constraint(equalTo: createDeleteLabel.bottomAnchor, constant: 30),
            createMatch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            createMatch.widthAnchor.constraint(equalToConstant: 110),
            createMatch.heightAnchor.constraint(equalToConstant: 110),
            
            deleteMatch.topAnchor.constraint(equalTo: createDeleteLabel.bottomAnchor, constant: 30),
            deleteMatch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            deleteMatch.widthAnchor.constraint(equalToConstant: 110),
            deleteMatch.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
}

extension CreateDeleteMatchView {
    @objc
    func didTapCreateMatch() {
        delegate?.createMatch()
    }
    
    @objc
    func didTapDeleteMatch() {
        delegate?.deleteMatch()
    }
}
