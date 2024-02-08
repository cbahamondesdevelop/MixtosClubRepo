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
    var viewModel: String
    //weak var delegate: EarthQuakeListViewDelegate?
    var players: [String]? = ["🚹 Juan", "🚹 Pedro", "🚹 Marcos", "🚺 Maria"]
    var reserves: [String]? = ["🚺 Carolina", "🚹 Antonio", "🚹 Rodrigo"]
    var sections: [String] = ["Inscritos", "Reservas"]
    var loginUser: String?
    
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
    
    init(viewModel: String){
        self.viewModel = viewModel
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
            return players?.count ?? textAPP.zeroDefault
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
            cell?.textLabel?.text = players?[indexPath.row]
        } else if indexPath.section == 1 {
            cell?.textLabel?.text = reserves?[indexPath.row]
        }
        
        guard let guardCell = cell else { return UITableViewCell(style: .default, reuseIdentifier: "CellIdentifier")}
        
        return guardCell
    }
}
