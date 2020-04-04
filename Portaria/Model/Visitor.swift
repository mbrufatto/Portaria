//
//  Visitor.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 02/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation
import RealmSwift

enum Category: String {
    case serviceProvider = "Prestador de Serviço"
    case privateVisit = "Particular"
        
    func value() -> String {
        return self.rawValue
    }
}

class Visitor: Object {
    dynamic var startDateAndHour: Date! = Date()
    dynamic var endDateAndHour: Date? = nil
    dynamic var name: String! = ""
    dynamic var phone: String! = ""
    dynamic var responsibleAccess: String! = ""
    dynamic var category: Category!
}
