//
//  HistoricalMatchesView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 11-04-24.
//

import Foundation
import UIKit

class HistoricalMatchesView: UIView {
    let textAPP = TextsInTheApp()
    var viewModel: String
    
    var activeDesactive: [String] = ["Activos", "Inactivos"]
    var active: [String]? = ["12 Marzo 2024", "14 Marzo 2024"]
    var desactive: [String]? = ["29 Febrero 2024", "27 Febrero 2024", "22 Febrero 2024", "20 Febrero 2024", "15 Febrero 2024", "13 Febrero 2024"]
    var loginUser: String?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.historicalMatches
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var matchesTableView: UITableView = {
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
}

extension HistoricalMatchesView {
    
    private func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(matchesTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            matchesTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            matchesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            matchesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            matchesTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension HistoricalMatchesView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if activeDesactive[section] == "Activos" {
            return active?.count ?? textAPP.zeroDefault
        } else {
            return desactive?.count ?? textAPP.zeroDefault
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return activeDesactive.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return activeDesactive[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = matchesTableView.dequeueReusableCell(withIdentifier: "CellIdentifier")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellIdentifier")
        }
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = active?[indexPath.row]
        } else if indexPath.section == 1 {
            cell?.textLabel?.text = desactive?[indexPath.row]
        }
        
        guard let guardCell = cell else { return UITableViewCell(style: .default, reuseIdentifier: "CellIdentifier")}
        
        return guardCell
    }
}
