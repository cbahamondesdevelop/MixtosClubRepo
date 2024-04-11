//
//  CreateTeamViewCell.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 31-03-24.
//

import Foundation
import UIKit

protocol CreateTeamViewCellDelegate: AnyObject {
    func pressSwitch() -> Int
}

class CreateTeamViewCell: UITableViewCell {
    
    private var counter = 0
    var delegate: CreateTeamViewCellDelegate?
    
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
        contentView.addSubview(emojiLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(colorSwitch)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            emojiLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            emojiLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: emojiLabel.trailingAnchor, constant: 10),
            
            colorSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colorSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}

extension CreateTeamViewCell {
    @objc func switchChanged(sender: UISwitch) {
        counter = delegate?.pressSwitch() ?? 0
        
        if counter == 6 && sender.isOn != true {
            sender.isEnabled = false
        }
        
        if sender.isOn && counter <= 6 {
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
