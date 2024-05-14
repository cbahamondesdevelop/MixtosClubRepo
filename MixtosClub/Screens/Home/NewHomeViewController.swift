//
//  HomeViewController.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 06-02-24.
//

import Foundation
import UIKit

class NewHomeViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    let viewModel = FinanceModel(kindUser: kindUserType.standard.rawValue, numberOfMatches: 103, collectedMatch: 20, bills: 8000, isAvailable: 50000)
    let dateMatchesModel: ActiveMatchesModel = ActiveMatchesModel(date1: "15 Abril", date2: "17 Septiembre", date3: "22 Abril", date4: "3 Mayo")
    lazy var fakeFinanceModel: FinanceModel = {
        return FinanceModel(kindUser: kindUserType.admin.rawValue, numberOfMatches: 103, collectedMatch: 3000, bills: 89000, isAvailable: 103000)
    }()
    private let userLoggedIn = Players(apellido: "Bahamondes", email: "cristian@bahamondes.cl", genero: "Masculino", nombre: "Cristian", password: "123", perfil: kindUserType.admin.rawValue, rut: "17355830", telefono: "2233444")
    
    lazy var fakePeople = [Players(apellido: "Martinez", email: "m@a.cl", genero: "Masculino", nombre: "Juan", password: "1234", perfil: kindUserType.standard.rawValue, rut: "183432333", telefono: "998989"),
                           Players(apellido: "Romero", email: "m@a.cl", genero: "Femenino", nombre: "Maria", password: "3322", perfil: kindUserType.standard.rawValue, rut: "11212121", telefono: "213123")]
    lazy var fakePeople2 = [Players(apellido: "Morales", email: "m@a.cl", genero: "Masculino", nombre: "Martin", password: "1234", perfil: kindUserType.standard.rawValue, rut: "152627374", telefono: "998989"),
                           Players(apellido: "Astudillo", email: "m@a.cl", genero: "Femenino", nombre: "Daniela", password: "3322", perfil: kindUserType.standard.rawValue, rut: "152233321", telefono: "213123")]
    lazy var adminModelData = adminModel(infoFinance: fakeFinanceModel, infoPeople: fakePeople)
    
    
    private lazy var homeView: HomeView = {
        let view = HomeView(kindUser: kindUserType.admin.rawValue, activeSecondaryMatches: validateSecundaryMatches(), dateInfoModel: dateMatchesModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
        overrideUserInterfaceStyle = .light
        self.navigationItem.hidesBackButton = true
    }
    
    func showAlert() {
        let alert = UIAlertController(title: textAPP.titleAlert, message: textAPP.alertContent, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: textAPP.iAgree, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
    
    func validateSecundaryMatches() -> Bool {
        if dateMatchesModel.date3 != String() {
            return true
        } else {
            return false
        }
    }
}

extension NewHomeViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .purple
        view.addSubview(homeView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension NewHomeViewController: HomeViewDelegate {
    func tapFirstMatch() {
        let participateModel = ParticipateModel(dateMatch: dateMatchesModel.date1, matchAvailable: true, enrolledPlayers: fakePeople, reservePlayers: fakePeople2, loggedUser: userLoggedIn)
        
        let controller = NewActiveMatchesViewController(participateModel: participateModel)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tapSecondMatch() {
        let participateModel = ParticipateModel(dateMatch: dateMatchesModel.date2, matchAvailable: true, enrolledPlayers: fakePeople, reservePlayers: fakePeople2, loggedUser: userLoggedIn)
        
        let controller = NewActiveMatchesViewController(participateModel: participateModel)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tapThirdMatch() {
        let participateModel = ParticipateModel(dateMatch: dateMatchesModel.date3, matchAvailable: true, enrolledPlayers: fakePeople, reservePlayers: fakePeople2, loggedUser: userLoggedIn)
        
        let controller = NewActiveMatchesViewController(participateModel: participateModel)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tapFourthMatch() {
        let participateModel = ParticipateModel(dateMatch: dateMatchesModel.date4, matchAvailable: true, enrolledPlayers: fakePeople, reservePlayers: fakePeople2, loggedUser: userLoggedIn)
        
        let controller = NewActiveMatchesViewController(participateModel: participateModel)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func goPastMatches() {
        let controller = HistoricalMatchesViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func goFinance() {
        let controller = FinanceViewController(viewModel: viewModel)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func goAdminPanel() {
        let controller = AdminPanelViewController(viewModel: adminModelData)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
