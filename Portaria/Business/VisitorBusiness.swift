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
    
    func searchVisitorInContactsByName(_ visitorName: String) -> Visitor {
        if !visitorName.isEmpty {
            let toFetch = [CNContactGivenNameKey, CNContactPhoneNumbersKey, CNContactJobTitleKey]
            let predicate = CNContact.predicateForContacts(matchingName: visitorName)
            
            do {
            
                guard let contact = try search.unifiedContacts(matching: predicate, keysToFetch: toFetch as [CNKeyDescriptor]).first else {
                    return Visitor()
                }
                let visitor = Visitor()
                visitor.name = contact.givenName
                visitor.phone = contact.phoneNumbers.first?.value.stringValue
                visitor.category = contact.jobTitle == "Prestador de Serviço" ? .serviceProvider : .privateVisit
                
                return visitor
                
            } catch let err {
                print(err)
                return Visitor()
            }
        } else {
            print("Precisa passar o nome do visitante")
            return Visitor()
        }
    }
    
    func searchVisitorInDataBaseByName(_ visitorName: String) -> Visitor {
        let realm = try! Realm()
        return realm.objects(Visitor.self).filter("name = %@", visitorName).first!
    }
    
    func deleteVisitorInDatabase(visitor: Visitor) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(visitor)
        }
    }
    
    func deleteVisitorInContacts(_ visitorName: String) {
        let contact = self.searchVisitorInContacts(visitorName).mutableCopy() as! CNMutableContact
        self.requestSave.delete(contact)
        do {
            try self.search.execute(self.requestSave)
        } catch {
            print(error)
        }
    }

    func filterByWeek(){
        
    }
    
    func filterByMonth() {
        
    }
    
    func filterByYear() {
        
    }
    
    private func searchVisitorInContacts(_ visitorName: String) -> CNContact {
        if !visitorName.isEmpty {
            let toFetch = [CNContactGivenNameKey, CNContactPhoneNumbersKey, CNContactJobTitleKey]
            let predicate = CNContact.predicateForContacts(matchingName: visitorName)
            
            do {
                
                guard let contact = try search.unifiedContacts(matching: predicate, keysToFetch: toFetch as [CNKeyDescriptor]).first else {
                    return CNContact()
                }
                
                return contact
                
            } catch let err {
                print(err)
                return CNContact()
            }
        } else {
            print("Precisa passar o nome do visitante")
            return CNContact()
        }
    }
    
    private func addVisitorInContact(_ visitor: Visitor) {
        
        let requestSave = CNSaveRequest()
        let newContact = CNMutableContact()
        
        newContact.givenName = visitor.name
        newContact.phoneNumbers = [CNLabeledValue(label: "Mobile", value: CNPhoneNumber(stringValue: visitor.phone))]
        newContact.jobTitle = visitor.category.value()
        
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


