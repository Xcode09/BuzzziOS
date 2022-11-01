//
//  StationListView.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//


import SwiftUI
import AVKit
struct StationListView: View {
    @State var stations = Station.fetchAllStations()
    
    @State var isPlayerView = false
    @ObservedObject var playerViewModel = PlayerViewModel()
    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing:20){
                Text("MELBOURNE'S HOME OF CLASSIC HITS").font(.system(size: 24,weight: .bold))
                    .padding(.top)
                
                
                Spacer(minLength: 0.5)
                ForEach(stations,id:\.self) {
                    station in
                    
                    StationViewRow(station: station)
                        .onTapGesture {
                        // Some
                        if !station.streamURL.isEmpty {
                            playerViewModel.station = station
                            isPlayerView.toggle()
                        }
                    }
                    
//                    HStack{
//                        Image("logo")
//                            .resizable()
//                            .frame(width: 50,height: 50)
//                        VStack(alignment: .leading, spacing:8){
//                            Text(station.title)
//                                .font(.system(size: 22,weight: .bold))
//                            Text(station.desc)
//                        }
//
//                    }.onTapGesture {
//                        // Some
//                        if !station.streamURL.isEmpty {
//                            playerViewModel.station = station
//                            isPlayerView.toggle()
//                        }
//                    }
                    
                    
                }
            }.padding(.horizontal)
            
            
        }
        .sheet(isPresented: $isPlayerView, content: {
            PlayerView()
                        .environmentObject(playerViewModel)
        })
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .leading)
    }
    
    
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)

        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60), actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }

        return nil
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView()
    }
}
