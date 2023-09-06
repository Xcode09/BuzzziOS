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
    
//    init() {
//            let thumbImage = UIImage(systemName: "circle.fill")
//            UISlider.appearance().setThumbImage(thumbImage, for: .normal)
//        }
    var body: some View {
        VStack(spacing:20){
//                VStack(spacing:10){
//                    Spacer().frame(height: 5.0)
//
//                    ProgressView(value: 0.5,total: 1.0)
//                        .accentColor(Color(AssetsHelper.Colors.AccentColor.rawValue))
//                    HStack{
//                        Text("--:--")
//                            .bold()
//
//                        Spacer()
//
//                        Text("--:--")
//                            .bold()
//                    }
//                }
            
            HStack(spacing:20){
//                    Image(systemName: "bell")
//
//                    Spacer()
//
//                    Image(systemName: "hand.thumbsup")
                Spacer()
                PlayButton(playerViewModel: _playerViewModel)
                Spacer()
//                    Image(systemName: "hand.thumbsdown")
//
//                    Spacer()
//
//                    Image(systemName: "ellipsis")
            }
            
            Text(playerViewModel.track.title)
                .font(.system(size: 22,weight: .bold))
            
            Text(playerViewModel.track.artist)
                .font(.system(size: 22,weight: .bold))
            
            //Spacer().frame(height:30)
            
            HStack{
                Image(systemName: "speaker.wave.2")
                
//                    VolumeSlider()
//                        .frame(height: 20)
//                        .accentColor(Color(AssetsHelper.Colors.AccentColor.rawValue))
                
                Slider(value: $volumne) { done in
                    MPVolumeView.setVolume(Float(volumne))
                }
                .accentColor(Color(AssetsHelper.Colors.AccentColor.rawValue))
                
                //Image(systemName: "airplayaudio")
                
            }
            //.padding(.bottom,15)
            
            
//                HStack{
//                    Image(systemName: "play.circle.fill")
//                        .frame(width:20,height: 20)
//
//                    Spacer()
//                    Image(systemName: "bell")
//                        .frame(width:20,height: 20)
//                    Spacer()
//
//                    Image(systemName: "speaker.wave.2")
//                        .frame(width:20,height: 20)
//
//                    Spacer()
//                    Image(systemName: "info.circle")
//                        .frame(width:20,height: 20)
//
//                }
//                .padding(.bottom,15)
//                .padding(.horizontal)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(uiColor: .systemBackground))
        }
        
    }
    
    var smallView:some View
    {
        VStack(spacing:10){
            ZStack{
                Color.gray.opacity(0.7)
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                VStack{
                    
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 20,height: 20)
                        .scaledToFill()
                        .padding(.top)
                    
                    HStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 40,height: 40)
                            .scaledToFill()
                        
                        Spacer()
                        
                        Text(playerViewModel.track.title)
                            .font(.system(size: 22,weight: .bold))
                        Spacer()
                        
                        PlayButton(playerViewModel: _playerViewModel, small: true)
                    }
                }
                .padding()
            }
        
            Spacer()
            
            HStack{
                Image(systemName: "speaker.wave.2")
                
                Slider(value: $volumne) { done in
                    MPVolumeView.setVolume(Float(volumne))
                }
                .accentColor(Color(AssetsHelper.Colors.AccentColor.rawValue))
                
                Image(systemName: "airplayaudio")
                
            }
            
        }
        
    }
}

struct PlayerControlView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerControlView(selectMenu: .constant(.liveStation))
    }
}







