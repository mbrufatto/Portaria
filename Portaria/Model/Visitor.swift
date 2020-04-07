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
    @objc dynamic var startDateAndHour: Date! = Date()
    @objc dynamic var endDateAndHour: Date? = nil
    @objc dynamic var name: String! = ""
    @objc dynamic var phone: String! = ""
    @objc dynamic var responsibleAccess: String! = ""
    dynamic var category: Category!
}
