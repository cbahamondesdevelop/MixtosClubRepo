//
//  Players.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 22-10-23.
//

import Foundation

struct DataResponse: Decodable {
    var data:[Players]
}

struct Players: Decodable {
    var apellido: String
    var email: String
    var genero: String
    var nombre: String
    var password: String
    var perfil: String
    var rut: String
    var telefono: String
}

class PlayerDeprecated {
    static var shared = PlayerDeprecated()
    
    var apellido: String
    var email: String
    var genero: String
    var nombre: String
    var password: String
    var perfil: String
    var rut: String
    var telefono: String
    
    init(apellido: String = String(),
         email: String = String(),
         genero: String = String(),
         nombre: String = String(),
         password: String = String(),
         perfil: String = String(),
         rut: String = String(),
         telefono: String = String()) {
        self.apellido = apellido
        self.email = email
        self.genero = genero
        self.nombre = nombre
        self.password = password
        self.perfil = perfil
        self.rut = rut
        self.telefono = telefono
    }
}

