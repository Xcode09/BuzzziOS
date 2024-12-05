//
//  PlayerControlView.swift
//  Buzzz
//
//  Created by Ali on 23/08/2023.
//

import SwiftUI


struct PlayerControlView: View {
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @State var volumne = 1.0
    @Binding var selectMenu : MenuItems?
    
    var body: some View {
        VStack(spacing:10){
            HStack{
                Image("logo")
                    .resizable()
                    .frame(width:50,height: 50)
                    .aspectRatio(contentMode: .fill)
                
                Spacer()
                
                VStack(spacing: 1){
                    Text(playerViewModel.track.artist)
                        .font(.system(size: 18,weight: .bold))
                    
                    Text(playerViewModel.track.title)
                        .font(.system(size: 18,weight: .bold))
                }
                Spacer()
                
                Button(action: {
                    self.playerViewModel.togglePlaying()
                }) {
                    Image(playerViewModel.isPlaying ? "pause-button" : "play-button")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width:40, height:40)
            }
            
            HStack {
                Image(systemName:"speaker.wave.2")
                
//                Slider(value: $volumne) { done in
//                    MPVolumeView.setVolume(Float(volumne))
//                }
                
                 VolumeSlider()
                    .frame(height: 20)
                       //.padding(.horizontal)
                    //.offset(y:-8)
                
            }
        }
        .padding()
         .background {
             Rectangle()
                 .fill(Color(uiColor: .systemBackground))
         }
    }
}

struct PlayerControlView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerControlView(selectMenu: .constant(.liveStation))
    }
}






