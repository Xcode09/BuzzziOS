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
            Image(systemName: playerViewModel.isPlaying ? "pause" : "play")
                .resizable()
                .scaledToFit()
                .frame(width:30, height:30)
                .foregroundColor(Color.white)
                .padding(30)
                .modifier(PlayerControllerButtonModifier())
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
