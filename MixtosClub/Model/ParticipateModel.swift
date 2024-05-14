//
//  ParticipateModel.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 11-04-24.
//

import Foundation

struct ParticipateModel {
    var dateMatch: String
    var matchAvailable: Bool
    var enrolledPlayers: [Players]
    var reservePlayers: [Players]
    var loggedUser: Players
}
