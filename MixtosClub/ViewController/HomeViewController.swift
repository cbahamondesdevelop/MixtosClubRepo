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
    
    private var numberButton: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func tapOnMatch1(_ sender: Any) {
        numberButton = "m1"
    }
    
    @IBAction func tapOnMatch2(_ sender: Any) {
        numberButton = "m2"
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
            }
        }
    }
}
