//
//  Provider.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 22-10-23.
//

import Foundation
import Alamofire

final class Provider {
    
    static let shared = Provider()
    
    private let URLuser = "https://mixtosclub-default-rtdb.firebaseio.com/jugadores/-NhT2NawxBv02ZtiN3Sr/jugadores.json"
    private let statusOK = 200...299
    
    func getUsers(succes: @escaping(_ user: Players) -> (), failure: @escaping (_ error: Error?) -> ()) {
        AF.request(URLuser, method: .get).validate(statusCode: statusOK).responseDecodable (of: DataResponse.self) { response in
            if let user = response.value?.data {
                user.forEach { player in
                    succes(player)
                }
            } else {
                failure(response.error)
            }
        }
    }
}
