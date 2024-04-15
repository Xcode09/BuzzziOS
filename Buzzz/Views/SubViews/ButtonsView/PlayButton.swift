//
//  PlayButton.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI

struct PlayButton: View {

    // MARK: - PROPERTIES
    @EnvironmentObject var playerViewModel: PlayerViewModel
    var small: Bool = false
    // MARK: - VIEW
    var body: some View {
        Button(action: {
            self.playerViewModel.togglePlaying()
        }) {
            Image(playerViewModel.isPlaying ? "pause-button" : "play-button")
                .resizable()
                .scaledToFill()
                .frame(width:15, height:15)
//                    .foregroundColor(Color.white)
//                    .padding(15)
//                    .modifier(PlayerControllerButtonModifier())
        }
       
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayButton(small: false)
                .background(Color(UIColor.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewLayout(.fixed(width: 200, height: 200))
            .environmentObject(PlayerViewModel())
            


            PlayButton(small: false)
                .background(Color(UIColor.systemBackground))
                .environment(\.colorScheme, .light)
                .previewLayout(.fixed(width: 200, height: 200))
            .environmentObject(PlayerViewModel())
        }


    }
}
