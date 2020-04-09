//
//  StringExtension.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 08/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

extension String {
    
    func formatterToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: self)!
    }
}
