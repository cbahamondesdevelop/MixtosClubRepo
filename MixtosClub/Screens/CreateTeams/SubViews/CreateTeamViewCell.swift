//
//  CreateTeamViewCell.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 31-03-24.
//

import Foundation
import UIKit

class CreateTeamViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var colorSwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.addTarget(self, action: #selector(switchChanged), for: .touchUpInside)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CreateTeamViewCell {
    private func buildViewHierarchy() {
        //[nameLabel, emojiLabel, colorSwitch].forEach(addSubview)
        contentView.addSubview(nameLabel)
        contentView.addSubview(emojiLabel)
        contentView.addSubview(colorSwitch)
    }
    
    private func setupConstraints() {
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        emojiLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        emojiLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        colorSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        colorSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
}

extension CreateTeamViewCell {
    @objc func switchChanged(sender: UISwitch) {
        if sender.isOn {
            contentView.backgroundColor = .black
            nameLabel.textColor = .white
            emojiLabel.textColor = .white
        } else {
            contentView.backgroundColor = .white
            nameLabel.textColor = .black
            emojiLabel.textColor = .black
        }
    }
}
