//
//  TeamListView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 07-02-24.
//

import Foundation
import UIKit

class TeamListView: UIView {
    
    let textAPP = TextsInTheApp()
    var viewModel: ParticipateModel
    var enrolledPlayers: [Players]?
    var reserves: [Players]?
    var sections: [String] = ["Inscritos", "Reservas"]
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.participants
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var registeredPlayersTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        return table
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: ParticipateModel){
        self.viewModel = viewModel
        self.enrolledPlayers = viewModel.enrolledPlayers
        self.reserves = viewModel.reservePlayers
        super.init(frame: .zero)
        buildViewHierarchy()
        setupConstraints()
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
    
    func addPlayer(player: Players) {
        if enrolledPlayers?.count ?? 0 >= 12 {
            reserves?.append(player)
        } else {
            enrolledPlayers?.append(player)
        }
        registeredPlayersTableView.reloadData()
    }
    
    func removePlayer(player: Players) {
        var enrolled = false
        var reserve = false
        var idEnrolled = 0
        var idReserve = 0
        
        if let idEnroll = enrolledPlayers?.firstIndex(of: player) {
            enrolled = true
            idEnrolled = idEnroll
        }
        
        if let idReserv = reserves?.firstIndex(of: player) {
            reserve = true
            idReserve = idReserv
        }
        
        if enrolled && idEnrolled != 0 {
            enrolledPlayers?.remove(at: idEnrolled)
        }
        
        if reserve && idReserve != 0 {
            reserves?.remove(at: idReserve)
        }
        
        registeredPlayersTableView.reloadData()
    }
}

extension TeamListView {
    
    private func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(registeredPlayersTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            registeredPlayersTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            registeredPlayersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            registeredPlayersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            registeredPlayersTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension TeamListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections[section] == "Inscritos" {
            return enrolledPlayers?.count ?? textAPP.zeroDefault
        } else {
            return reserves?.count ?? textAPP.zeroDefault
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = registeredPlayersTableView.dequeueReusableCell(withIdentifier: "CellIdentifier")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellIdentifier")
        }
        
        if indexPath.section == textAPP.zeroDefault {
            cell?.textLabel?.text = matchIcon(genero: enrolledPlayers?[indexPath.row].genero ?? "") + " " + (enrolledPlayers?[indexPath.row].nombre ?? "")
        } else if indexPath.section == 1 {
            cell?.textLabel?.text = matchIcon(genero: reserves?[indexPath.row].genero ?? "") + " " + (reserves?[indexPath.row].nombre ?? "")
        }
        
        guard let guardCell = cell else { return UITableViewCell(style: .default, reuseIdentifier: "CellIdentifier")}
        
        return guardCell
    }
}
