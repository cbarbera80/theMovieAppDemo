//
//  SceneDelegate.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 20/02/21.
//

import UIKit
import MovieDBAppServices

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = scene as? UIWindowScene else { return }
    
        let appWindow = UIWindow(windowScene: windowScene)
       
        let services = APIServices()
        let mock = MockAPIServices()
        let appCoordinator = AppCoordinator(withWindow: appWindow, services: services)
       
        appCoordinator.start()
        
        coordinator = appCoordinator
        window = appWindow
        
        window?.makeKeyAndVisible()
    }
}
