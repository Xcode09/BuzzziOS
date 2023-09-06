//
//  BuzzzApp.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI

@main
struct BuzzzApp: App {
    //@ObservedObject var playerViewModel = PlayerViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            //MenuListView()
            //PlayerView().environmentObject(playerViewModel)
             SplashView()
            
            
                
            
            //PlayerControlView().environmentObject(playerViewModel)
        }
        
    }
}
