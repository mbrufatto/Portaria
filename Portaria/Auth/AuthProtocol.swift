//
//  AuthProtocol.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 08/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

protocol AuthProtocol: class {
    func isLogged() -> Bool
    func saveToken(token: String)
}

