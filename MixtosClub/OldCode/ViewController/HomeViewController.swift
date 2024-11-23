//
//  HomeViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 18-10-23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var match1: UIButton!
    @IBOutlet weak var match2: UIButton!
    @IBOutlet weak var enterPanelAdmin: UIButton!
    
    private var numberButton: String = String()
    
    var user: Players?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(PlayerDeprecated.shared.nombre)
    }
    
    init(user: Players?) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    @IBAction func tapOnMatch1(_ sender: Any) {
        numberButton = "m1"
    }
    
    @IBAction func tapOnMatch2(_ sender: Any) {
        numberButton = "m2"
    }
    
    @IBAction func tapPanelAdmin(_ sender: Any) {
    }
    
    private func validateUser() {
        if PlayerDeprecated.shared.perfil == "admin" {
            enterPanelAdmin.isEnabled = true
            enterPanelAdmin.backgroundColor = .systemPurple
        } else {
            enterPanelAdmin.isEnabled = false
            enterPanelAdmin.backgroundColor = .gray
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueM1" {
            if let destinationVC = segue.destination as? ActiveMatchesViewController {
                destinationVC.titleScreen = "23 de octubre 2023"
                destinationVC.players = ["🚹 Juan", "🚹 Pedro", "🚹 Marcos", "🚺 Maria"]
                destinationVC.reserves = ["🚺 Carolina", "🚹 Antonio", "🚹 Rodrigo"]
            }
        }
        
        if segue.identifier == "segueM2" {
            if let destinationVC = segue.destination as? ActiveMatchesViewController {
                destinationVC.titleScreen = "25 de octubre 2023"
                destinationVC.players = []
                destinationVC.reserves = []
            }
        }
    }
}
