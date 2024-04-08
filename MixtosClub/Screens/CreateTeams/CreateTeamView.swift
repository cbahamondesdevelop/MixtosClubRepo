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
    
    var colorTeams: [String] = ["Equipo Negro ⚫️", "Equipo Blanco ⚪️"]
    var people: [String] = ["Juan", "Pedro", "Marcos", "Matias", "Maria", "Rosa"]
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
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            playersTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            playersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            playersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            playersTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
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
        cell.emojiLabel.text = "✌🏻"
        
        return cell
    }
}
