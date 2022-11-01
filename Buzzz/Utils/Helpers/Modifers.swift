//
//  Modifers.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI

struct TitleModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .rounded))
            .padding()
    }
}

struct LogoModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .shadow(radius: 5)
            .overlay(
                Circle()
                    .stroke(Color(UIColor.systemBlue), lineWidth: 1)
                    .opacity(0.3)
            )
    }
}

struct TrackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Rectangle())
            .shadow(radius: 5)
            .overlay(
                Circle()
                    .stroke(Color(UIColor.systemBlue), lineWidth: 1)
                    .opacity(0.3)
            )
            .padding(10)
    }
}


struct PlayerControllerButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                Circle()
                    .fill(Color(AssetsHelper.Colors.PlayPauseButtonBg.rawValue))
                    .shadow(color: Color("ColorOffWhiteShadowFinishAdaptive"), radius: 10, x: 10, y: 10)
            )
    }
}


struct ActionButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(AssetsHelper.Colors.ActionButton.rawValue))
            .padding(10)
            .shadow(color: Color("ColorOffWhiteShadowFinishAdaptive"), radius: 5, x: 5, y: 5)
    }
}


