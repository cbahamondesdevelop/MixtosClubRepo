//
//  CreateTeamViewCell.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 31-03-24.
//

import Foundation
import UIKit

class CreateTeamViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let emojiLabel = UILabel()
    let colorSwitch = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Configuración de la etiqueta del nombre
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        // Configuración de la etiqueta del emoticón
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(emojiLabel)
        emojiLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        emojiLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        // Configuración del interruptor de color
        colorSwitch.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(colorSwitch)
        colorSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        colorSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        colorSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        
        // Configuración de la apariencia inicial
        nameLabel.text = "Nombre"
        emojiLabel.text = "😊"
        contentView.backgroundColor = .white
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
