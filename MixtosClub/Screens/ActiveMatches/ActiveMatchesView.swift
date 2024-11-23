//
//  ActiveMatchesView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 07-02-24.
//

import Foundation
import UIKit

protocol ActiveMatchesViewDelegate: AnyObject {
    func seeTeams()
    func participate(loggedUser: Players)
    func iPreferNotToParticipate(loggedUser: Players)
}

class ActiveMatchesView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: ActiveMatchesViewDelegate?
    var viewModel: ParticipateModel
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.inscription
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var headerView: HeaderView = {
        let view = HeaderView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    lazy var teamListView: TeamListView = {
        let view = TeamListView(viewModel: viewModel)
        //view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(viewModel: ParticipateModel){
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActiveMatchesView {
    
    private func buildViewHierarchy() {
        [titleLabel, headerView, teamListView].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            headerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            teamListView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            teamListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            teamListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            teamListView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension ActiveMatchesView: HeaderViewDelegate {
    func iPreferNotToParticipate(loggedUser: Players) {
        delegate?.iPreferNotToParticipate(loggedUser: loggedUser)
    }
    
    func participate(loggedUser: Players) {
        delegate?.participate(loggedUser: loggedUser)
    }
    
    func seeTeams() {
        delegate?.seeTeams()
    }
}
