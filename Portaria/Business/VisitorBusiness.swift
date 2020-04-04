//
//  Business.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 03/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit
import ContactsUI
import RealmSwift

class VisitorBusiness: VisitorBusinessProtocol {
    
    private let requestSave = CNSaveRequest()
    private let search = CNContactStore()
    
    func save(isAddInContacts: Bool, visitor: Visitor) {
        if validateVisitor(visitor) {
            if isAddInContacts {
                self.addVisitorInContact(visitor)
            }
            self.addVisitorInDatabase(visitor)
        } else {
            print("Não foi possível cadastrar o visitante, você deve preencher todos os dados")
        }
    }
    
    func listVisitorDatabase() -> Results<Visitor> {
        let realm = try! Realm()
        return realm.objects(Visitor.self)
    }
    
    func searchVisitorInContactsByName(visitorName: String) {
        if !visitorName.isEmpty {
            let toFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactImageDataAvailableKey]
            let predicate = CNContact.predicateForContacts(matchingName: visitorName)
            
            do {
                let contacts = try search.unifiedContacts(matching: predicate, keysToFetch: toFetch as [CNKeyDescriptor])
                
                for contact in contacts {
                    let Dictionary = NSMutableDictionary()
                    
                    let name = contact.givenName
                    let familyname = contact.familyName
                    Dictionary.setValue(name, forKey: "givenName")
                    Dictionary.setValue(familyname, forKey: "familyName")
                    
                    //TODO retornar o visitante (visitor)
                }
            } catch let err {
                print(err)
            }
        } else {
            print("Precisa passar o nome do visitante")
        }
    }

    func filterByWeek(){
        
    }
    
    func filterByMonth() {
        
    }
    
    func filterByYear() {
        
    }
    
    private func addVisitorInContact(_ visitor: Visitor) {
        
        let requestSave = CNSaveRequest()
        let newContact = CNMutableContact()
        
        newContact.givenName = visitor.name
        newContact.phoneNumbers = [CNLabeledValue(label: "Mobile", value: CNPhoneNumber(stringValue: visitor.phone))]
        newContact.note = visitor.category.value()
        
        requestSave.add(newContact, toContainerWithIdentifier: nil)
        
        do {
            try search.execute(requestSave)
        } catch {
            print(error)
        }
    }
    
    private func addVisitorInDatabase(_ visitor: Visitor) {
        
        let realm = try! Realm()

        try! realm.write {
            realm.add(visitor)
        }
    }
    
    private func validateVisitor(_ visitor: Visitor) -> Bool {
        
        guard let _ = visitor.startDateAndHour,
            let _ = visitor.name,
            let _ = visitor.phone,
            let _ = visitor.responsibleAccess,
            let _ = visitor.category else {
                return false
        }
        return true
    }
}


