//
//  ShowEquipmentView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 08-02-24.
//

import Foundation
import UIKit

class ShowEquipmentView: UIView {
    
    let textAPP = TextsInTheApp()
    var viewModel: String
    //weak var delegate: EarthQuakeListViewDelegate?
    var colorTeams: [String] = ["Equipo Negro ⚫️", "Equipo Blanco ⚪️"]
    var blackTeam: [String]? = ["🚹 Juan", "🚹 Pedro", "🚹 Marcos", "🚹 Matias", "🚺 Maria", "🚺 Rosa"]
    var whiteTeam: [String]? = ["🚹 Antonio", "🚹 Rodrigo", "🚹 Esteban", "🚹 Andres", "🚺 Carolina", "🚺 Andrea"]
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

extension ShowEquipmentView {
    
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

extension ShowEquipmentView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if colorTeams[section] == "Equipo Negro ⚫️" {
            return blackTeam?.count ?? textAPP.zeroDefault
        } else {
            return whiteTeam?.count ?? textAPP.zeroDefault
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return colorTeams.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return colorTeams[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = playersTableView.dequeueReusableCell(withIdentifier: "CellIdentifier")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellIdentifier")
        }
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = blackTeam?[indexPath.row]
        } else if indexPath.section == 1 {
            cell?.textLabel?.text = whiteTeam?[indexPath.row]
        }
        
        guard let guardCell = cell else { return UITableViewCell(style: .default, reuseIdentifier: "CellIdentifier")}
        
        return guardCell
    }
}
