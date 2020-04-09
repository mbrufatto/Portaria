//
//  Auth.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 08/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

class Auth: AuthProtocol {
    
    func saveToken(token: String) {
        UserDefaults.standard.set(token, forKey: "token")
    }
    
    func isLogged() -> Bool {
        guard
            UserDefaults.standard.string(forKey: "token") != nil else {
                return false
        }
        return true
    }
}
