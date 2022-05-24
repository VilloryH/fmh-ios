//
//  SceneDelegate.swift
//  fmh
//
//  Created: 18.04.2022
//

import UIKit
import Combine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
<<<<<<< HEAD
    
    var rootController: UINavigationController {
        let navigationController = UINavigationController()
        navigationController.view.backgroundColor = .accentColor
        navigationController.navigationBar.barStyle = .default
        navigationController.navigationBar.backgroundColor = .accentColor
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
           
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return window?.rootViewController as! UINavigationController
    }

    fileprivate lazy var coordinator = AppCoordinator(navigationController: rootController)
=======
    var appCoordinator: AppCoordinator?
>>>>>>> develop

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
<<<<<<< HEAD
        //KeyChain.standart.clear()
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
//        window?.rootViewController = OurMissionViewController()
//        window?.makeKeyAndVisible()
        
        coordinator.start()
=======
>>>>>>> develop
        
        AppSession.logOut()
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navigationController = makeNavigationControlle()
            appCoordinator = AppCoordinator(window: window)
            appCoordinator?.start()
            self.window = window
            window.makeKeyAndVisible()
        }

        func sceneDidDisconnect(_ scene: UIScene) {
            // Called as the scene is being released by the system.
            // This occurs shortly after the scene enters the background, or when its session is discarded.
            // Release any resources associated with this scene that can be re-created the next time the scene connects.
            // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        }
        
        func sceneDidBecomeActive(_ scene: UIScene) {
            // Called when the scene has moved from an inactive state to an active state.
            // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        }
        
        func sceneWillResignActive(_ scene: UIScene) {
            // Called when the scene will move from an active state to an inactive state.
            // This may occur due to temporary interruptions (ex. an incoming phone call).
        }
        
        func sceneWillEnterForeground(_ scene: UIScene) {
            // Called as the scene transitions from the background to the foreground.
            // Use this method to undo the changes made on entering the background.
        }
        
        func sceneDidEnterBackground(_ scene: UIScene) {
            // Called as the scene transitions from the foreground to the background.
            // Use this method to save data, release shared resources, and store enough scene-specific state information
            // to restore the scene back to its current state.
        }
        
    }
    
}
<<<<<<< HEAD
=======

// MARK: - UINavigationController
extension SceneDelegate {
   fileprivate func makeNavigationControlle() -> UINavigationController {
        let navigationController = UINavigationController()
        
        let app = UINavigationBarAppearance()
        app.titleTextAttributes = [.foregroundColor: UIColor.white]
        app.backgroundColor = .accentColor
        navigationController.navigationBar.compactAppearance = app
        navigationController.navigationBar.standardAppearance = app
        navigationController.navigationBar.scrollEdgeAppearance = app
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        return navigationController
    }
}
>>>>>>> develop
