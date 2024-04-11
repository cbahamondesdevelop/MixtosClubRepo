//
//  CreateTeamView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 19-03-24.
//

import Foundation
import UIKit

class CreateTeamView: UIView {
    
    let textAPP = TextsInTheApp()
    var viewModel: String
    
    var people: [String] = ["Juan", "Pedro", "Marcos", "Matias", "Maria", "Rosa", "Jhon", "Piter", "Jack", "Andrew", "Coralina", "Marta"]
    var loginUser: String?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.equipment + " " + "27 Febrero"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var playersTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CreateTeamViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.save, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
        return button
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: String){
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
    }
    
    private func matchIcon(genero: String) -> String {
        var icon = String()
        
        if genero == "Masculino" {
            icon = "🚹"
        } else {
            icon = "🚺"
        }
        
        return icon
    }
}

extension CreateTeamView {
    
    private func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(playersTableView)
        addSubview(saveButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            playersTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            playersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            playersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            playersTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension CreateTeamView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! CreateTeamViewCell
        
        
        cell.nameLabel.text = people[indexPath.row]
        cell.emojiLabel.text = "🚹"
        cell.delegate = self
        
        return cell
    }
}

extension CreateTeamView {
    @objc
    func didTapSave() {
        print("Voy a guardar")
    }
    
    func countSwitchesOn(in view: UIView) -> Int {
        var count = 0
        for subview in view.subviews {
            
            if let switchView = subview as? UISwitch {
    
                if switchView.isOn {
                    count += 1
                }
            }

            if subview.subviews.count > 0 {
                count += countSwitchesOn(in: subview)
            }
        }
        
        return count
    }
}

extension CreateTeamView: CreateTeamViewCellDelegate {
    func pressSwitch() -> Int {
        return countSwitchesOn(in: self)
    }
}
