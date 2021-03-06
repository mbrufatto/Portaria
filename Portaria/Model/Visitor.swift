//
//  Visitor.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 02/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation
import RealmSwift

class Visitor: Object, Codable {
    @objc dynamic var startDateAndHour: Date! = Date()
    @objc dynamic var endDateAndHour: Date? = nil
    @objc dynamic var name: String! = ""
    @objc dynamic var phone: String! = ""
    @objc dynamic var responsibleAccess: String! = ""
    @objc dynamic var category: String = ""
}
