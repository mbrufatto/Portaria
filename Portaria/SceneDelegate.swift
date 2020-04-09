//
//  SceneDelegate.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 31/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let auth = Auth()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        mainScreen(scene)
    }
    
    private func mainScreen(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
        self.window?.rootViewController = auth.isLogged() ? loginScreen(storyboard) : listVisitor(storyboard)
        self.window?.makeKeyAndVisible()
    }
    
    private func loginScreen(_ storyboard: UIStoryboard) -> UINavigationController{
        guard let rootVC = storyboard.instantiateViewController(identifier: "ListVisitorViewController") as? ListVisitorViewController else {
            print("ViewController not found")
            return UINavigationController()
        }
        return UINavigationController(rootViewController: rootVC)
        
    }
    
    private func listVisitor(_ storyboard: UIStoryboard) -> UINavigationController {
        guard let rootVC = storyboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else {
            print("ViewController not found")
            return UINavigationController()
        }
        return UINavigationController(rootViewController: rootVC)
    }


}

