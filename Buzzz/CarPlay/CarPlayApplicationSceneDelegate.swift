//
//  CarPlayApplicationSceneDelegate.swift
//  Buzzz
//
//  Created by MacBook Pro on 03/11/2022.
//

import Foundation
import CarPlay
import UIKit
/// `CarPlayApplicationSceneDelegate` is the UIScenDelegate and CPTemplateApplicationSceneDelegate.
class CarPlayApplicationSceneDelegate: NSObject {
    
    /// The template manager handles the connection to CarPlay and manages the displayed templates.
    let templateManager = BuzzCarPlayManager()
    var window:CPWindow?
    
    // MARK: UISceneDelegate
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if scene is CPTemplateApplicationScene, session.configuration.name == "BuzzSceneConfiguration" {
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        if scene.session.configuration.name == "BuzzSceneConfiguration" {
            
        }
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        if scene.session.configuration.name == "BuzzSceneConfiguration" {
            
        }
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        if scene.session.configuration.name == "BuzzSceneConfiguration" {
            
        }
    }
    
}
// MARK: CPTemplateApplicationSceneDelegate

extension CarPlayApplicationSceneDelegate: CPTemplateApplicationSceneDelegate {
    
    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didConnect interfaceController: CPInterfaceController) {
        templateManager.connect(interfaceController)
//        self.window = window
//        window.rootViewController = UIHostingController(rootView: StationListView())
        
    }
    
    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
                                  didDisconnectInterfaceController interfaceController: CPInterfaceController) {
        templateManager.disconnect()
    }
}
