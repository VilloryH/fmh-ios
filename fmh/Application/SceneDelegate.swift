//
//  SceneDelegate.swift
//  fmh
//
//  Created: 18.04.2022
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow (windowScene: windowScene)
        self.window?.rootViewController = ModelBuilder.createNavController()
        self.window?.makeKeyAndVisible()
        
        //TODO: - ПРОПИСАТЬ Coordinator (Router)
    
        // Okok

    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }
}

