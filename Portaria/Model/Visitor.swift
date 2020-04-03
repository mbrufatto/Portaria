//
//  Visitor.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 02/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

enum Category: String {
    case serviceProvider = "Prestador de Serviço"
    case privateVisit = "Particular"
        
    func value() -> String {
        return self.rawValue
    }
}

struct Visitor {
    let endDateAndHour: Date?
    let name: String
    let phone: String
    let responsibleAccess: String
    let category: Category
}
