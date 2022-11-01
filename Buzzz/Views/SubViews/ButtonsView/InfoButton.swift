//
//  InfoButton.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI

struct InfoButton: View {
    // MARK: - PROPERTIES
    let size: CGFloat
    @State private var showAboutModal: Bool = false
    
    // MARK: - VIEW
    var body: some View {
         Button(action: {
                   self.showAboutModal.toggle()
               }) {
                   Image(systemName: "info.circle")
                       .resizable()
                       .scaledToFit()
                       .frame(width:size, height: size)
                    .foregroundColor(Color(AssetsHelper.Colors.ActionButton.rawValue))
                       .modifier(ActionButtonModifier())
               }.sheet(isPresented: $showAboutModal) {
                   if #available(iOS 16.0, *) {
                       AboutView()
                           .presentationDetents([.medium,.large])
                   } else {
                       // Fallback on earlier versions
                       AboutView()
                   }
               }
    }
}

struct InfoButton_Previews: PreviewProvider {
    static var previews: some View {
        InfoButton(size: 30)
    }
}
