//
//  SplashView.swift
//  Buzzz
//
//  Created by Berisco Pvt on 06/09/2023.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive :Bool = true
    @ObservedObject var playerViewModel = PlayerViewModel()
    var body: some View {
        ZStack{
            if isActive {
                ZStack{
                    Image("bg1")
                        .resizable()
                        .frame(maxWidth: .infinity,maxHeight:.infinity)
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 240,height: 240)
                        .scaledToFill()
                }
            }
            else{
                PlayerView().environmentObject(playerViewModel)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+5.0) {
                withAnimation{
                    self.isActive = false
                }
                
            }
        }
        
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
