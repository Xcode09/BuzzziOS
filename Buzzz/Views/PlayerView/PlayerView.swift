//
//  PlayerView.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI


struct PlayerView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @State var adsFlag = false
    
    // MARK: - VIEW
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            VStack(alignment: .center, spacing: 10) {
                        
                // MARK: Album Logo Section
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: artworkSize, height: artworkSize, alignment: .center)
                    .modifier(LogoModifier())
                
                
//                if (self.playerViewModel.track.artworkURL != nil) {
//                    ImageLoaderView(imageUrl: self.playerViewModel.track.artworkURL!)
//                        .frame(width: artworkSize, height: artworkSize, alignment: .center)
//                    .background(
//                        Circle()
//                            .fill(Color("ColorOffWhiteAdaptive"))
//                            .shadow(color: Color("ColorOffWhiteShadowFinishAdaptive"), radius: 10, x: 10, y: 10)
//
//                    )
//                } else {
//                    Image("logo")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: artworkSize, height: artworkSize, alignment: .center)
//                        .modifier(LogoModifier())
//                }
                
                VStack{
                    HStack{
                        Circle().fill(.red)
                            .frame(width: 20,height: 20)
                        Text("LIVE")
                        
                    }
                    // MARK: Radio Station Name
                    // config file: station_title
                    Text(playerViewModel.station.title)
                        .font(.system(.headline, design: .default))
                        .fontWeight(.semibold)
                        .padding(.horizontal, 10)
                        .multilineTextAlignment(.center)
                    
                    // MARK: Radio Station Description
                    // config file: station_desc
                    Text(playerViewModel.station.desc)
                        .font(.system(.caption, design: .default))
                        .fontWeight(.light)
                        .padding(.horizontal, 10)
                        .multilineTextAlignment(.center)
                }
                .padding(.top,30)
                
                Spacer()
                if !self.playerViewModel.track.metaTitle().isEmpty {
                    HStack{
                        Image(systemName: "mic")
                        
                        Text("Now Playing")
                            .foregroundColor(.gray)
                    }
                }
                // MARK: Song Title
                Text(self.playerViewModel.track.metaTitle())
                    .font(.system(.body, design: .default))
                    .fontWeight(.light)
                
//                // MARK: Radio Station Name
//                // config file: station_title
//                Text(playerViewModel.station.title)
//                    .font(.system(.title, design: .rounded))
//                    .fontWeight(.semibold)
//                    .padding(.horizontal, 10)
//                    .multilineTextAlignment(.center)
                
//                // MARK: Radio Station Description
//                // config file: station_desc
//                Text(playerViewModel.station.desc)
//                    .font(.system(.caption, design: .rounded))
//                    .fontWeight(.light)
//                    .padding(.horizontal, 10)
//                    .multilineTextAlignment(.center)
                
                Spacer()
                    
//                HStack(alignment: .center, spacing: 20) {
//                    if(showRecordingFeature) {
//                        RecordingButton(size: 30)
//                    }
//                    if(showSleepTimerFeature) {
//                        SleepButton(size: 30)
//                    }
                    
                
                HStack(alignment: .center, spacing: 40) {
                    //ShareButton(size: 30)
                    
//                }
                    Spacer().frame(width: 30)
                    
                    // MARK: Pause/Resume
                    if(playerViewModel.isLoading) {
                        ActivityIndicator()
                            .frame(width:90, height: 90)
                            .foregroundColor(Color(AssetsHelper.Colors.PlayPauseButton.rawValue))
                    } else {
                        PlayButton()
                            .offset(y:-40)
                    }
                    
                    InfoButton(size: 30)
                }
                
                // Control the volume
                VolumeSlider()
                    .frame(height: 20)
                    .padding(.horizontal)
                
                
//                if adsFlag && showAds {
//                    BannerVC()
//                        .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height, alignment: .center)
//                }
            } // VStack
                .padding(.vertical, showAds ? 0 : 20)
            
            
        } // ZStack
        .frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
        )
        .background(
            VStack {
                Image("bg1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3)
            }
        )
        .onAppear {
            playerViewModel.station = Station(title: station_title, streamURL: station_streamURL, desc: station_desc)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                // Show ads after 5 seconds when app is ready
                adsFlag = true
            }
            
        }
        .onDisappear {
            playerViewModel.stopPlaying()
        }
        
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
