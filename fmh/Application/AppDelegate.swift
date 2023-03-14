//
//  AppDelegate.swift
//  fmh
//
//  Created: 18.04.2022
//


import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Если галка "Сохранить пароль" не стояла при вводе логина/пароля то стираем данные пользователя
        if UserDefaults.standard.bool(forKey: "safeAccount") == false {
            Helper.Core.TokenManager.clear()
        }
    }
}
