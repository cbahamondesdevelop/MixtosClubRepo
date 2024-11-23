//
//  LittleModel.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 15-04-24.
//

import Foundation

struct ActiveMatchesModel {
    var date1: String
    var date2: String
    var date3: String
    var date4: String
}

struct adminModel {
    var infoFinance: FinanceModel
    var infoPeople: [Players]
}
