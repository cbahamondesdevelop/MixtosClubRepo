//
//  ShowTeamsViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 25-10-23.
//

import UIKit

class ShowTeamsViewController: UIViewController {

    @IBOutlet weak var teamsTableView: UITableView!
    
    private let zeroDefault : Int = 0
    
    var colorTeams: [String] = ["Equipo Negro ⚫️", "Equipo Blanco ⚪️"]
    var blackTeam: [String]? = ["🚹 Juan", "🚹 Pedro", "🚹 Marcos", "🚺 Maria"]
    var whiteTeam: [String]? = ["🚺 Carolina", "🚹 Antonio", "🚹 Rodrigo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamsTableView.dataSource = self
    }

}

extension ShowTeamsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if colorTeams[section] == "Equipo Negro ⚫️" {
            return blackTeam?.count ?? zeroDefault
        } else {
            return whiteTeam?.count ?? zeroDefault
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return colorTeams.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return colorTeams[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = teamsTableView.dequeueReusableCell(withIdentifier: "CellIdentifier")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellIdentifier")
        }
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = blackTeam?[indexPath.row]
        } else if indexPath.section == 1 {
            cell?.textLabel?.text = whiteTeam?[indexPath.row]
        }
        
        return cell!
    }
}
