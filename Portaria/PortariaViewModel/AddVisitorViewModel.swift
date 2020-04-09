//
//  AddVisitorViewModel.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 08/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

class AddVisitorViewModel {
    
    private let category: [String] = ["Prestador de Serviço", "Particular"]
    
    func listAllCategory() -> [String] {
        return self.category
    }
    
    func numberOfCategory() -> Int {
        return self.category.count
    }
    
    func categoryAt(index: Int) -> String {
        return self.category[index]
    }
    
}
