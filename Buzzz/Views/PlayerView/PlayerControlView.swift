//
//  PlayerControlView.swift
//  Buzzz
//
//  Created by Berisco Pvt on 23/08/2023.
//

import SwiftUI
import MediaPlayer

struct PlayerControlView: View {
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @State var volumne = 1.0
    @Binding var selectMenu : MenuItems?
    
    var body: some View {
        VStack(spacing:10){
            PlayButton(playerViewModel: _playerViewModel)
                .padding(.top,10)
                .frame(width:46,height: 46)
            
            Text(playerViewModel.track.artist)
                .font(.system(size: 22,weight: .bold))
            
            Spacer().frame(height:10)
            
            Text(playerViewModel.track.title)
                .font(.system(size: 22,weight: .bold))
            HStack {
                Image(systemName:"speaker.wave.2")
                
                Slider(value: $volumne) { done in
                    MPVolumeView.setVolume(Float(volumne))
                }
                
                
            }.padding(.bottom,20)
            
            Spacer()
            
        }
        .padding(.horizontal)
         .background {
             RoundedRectangle(cornerRadius: 10)
                 .fill(Color(uiColor: .systemBackground))
         }
    }
}

struct PlayerControlView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerControlView(selectMenu: .constant(.liveStation))
    }
}







