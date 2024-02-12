//
//  ActiveMatchesViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 18-10-23.
//

import UIKit

class ActiveMatchesViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var namePlayersTableView: UITableView!
    @IBOutlet weak var btnVerEquiposControl: UIButton!
    @IBOutlet weak var btnParticiparControl: UIButton!
    @IBOutlet weak var btnMejorNoParticipoControl: UIButton!
    
    private let zeroDefault : Int = 0
    
    var titleScreen: String?
    var players: [String]?
    var reserves: [String]?
    var sections: [String] = ["Inscritos", "Reservas"]
    var loginUser: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let titleText = titleScreen else { return }
        titleLabel.text = titleText
        
        namePlayersTableView.dataSource = self
        initialState()
    }
    
    func removePlayer(posIndex:Int) {
        players?.remove(at: posIndex)
    }
    
    func getIndex(nombre: String) -> Int {
        var respuesta:Int = 0
        
        guard let guardPlayer = players else { return 0 }
        
        guardPlayer.forEach { dato in
            if dato == nombre {
                if let idPlayer = guardPlayer.firstIndex(of: dato){
                    respuesta = idPlayer
                }
            }
        }
        return respuesta
    }

    @IBAction func tapDoNotParticipate(_ sender: Any) {
        let icon = matchIcon(genero: Player.shared.genero)
        
        let find = icon + " " + Player.shared.nombre
        let id = getIndex(nombre: find)
        removePlayer(posIndex: id)
        namePlayersTableView.reloadData()
        initialState()
    }
    
    @IBAction func tapShowTeams(_ sender: Any) {
    }
    
    @IBAction func tapParticipate(_ sender: Any) {
        let icon = matchIcon(genero: Player.shared.genero)
        
        players?.append(icon + " " + Player.shared.nombre)
        namePlayersTableView.reloadData()
        
        btnParticiparControl.isEnabled = false
        btnParticiparControl.backgroundColor = .gray
        
        btnMejorNoParticipoControl.isEnabled = true
        btnMejorNoParticipoControl.backgroundColor = .systemPink
    }
    
    private func initialState() {
        btnMejorNoParticipoControl.isEnabled = false
        btnMejorNoParticipoControl.backgroundColor = .gray
        
        btnVerEquiposControl.isEnabled = true
        btnVerEquiposControl.backgroundColor = .gray
        
        btnParticiparControl.isEnabled = true
        btnParticiparControl.backgroundColor = .systemGreen
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

extension ActiveMatchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections[section] == "Inscritos" {
            return players?.count ?? zeroDefault
        } else {
            return reserves?.count ?? zeroDefault
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = namePlayersTableView.dequeueReusableCell(withIdentifier: "CellIdentifier")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellIdentifier")
        }
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = players?[indexPath.row]
        } else if indexPath.section == 1 {
            cell?.textLabel?.text = reserves?[indexPath.row]
        }
        
        return cell!
    }
}
