//
//  ShareButton.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI

struct ShareButton: View {
    // MARK: - PROPERTIES
    let size: CGFloat
    
    @State private var showShareSheet: Bool = false
    
    // MARK: - VIEW
    var body: some View {
        Button( action: {
            self.showShareSheet = true
        }) {
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .scaledToFit()
                .frame(width:size, height: size)
                .modifier(ActionButtonModifier())
        }
        .sheet(isPresented: $showShareSheet) {
            if #available(iOS 16.0, *) {
                ShareView().presentationDetents([.height(100),.medium])
            } else {
                // Fallback on earlier versions
                ShareView()
            }
        }
    }
}

// MARK: - PREVIEW
struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton(size: 30)
            .previewLayout(.sizeThatFits)
        
    }
}

