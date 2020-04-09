//
//  LoginViewController.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 08/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    private let auth = Auth()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.isNavigationBarHidden = true;
    }

    /*
    // Aqui faria uma chamada no webservice
    // Criaria uma camada de network, onde teria o método para chamar a autenticação e retornar um token, que serveria para
    // as outras chamadas da api.
    */
    @IBAction func tapLogin() {
        auth.saveToken(token: "abcdefgh")
    }
}
