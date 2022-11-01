//
//  AboutView.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI

struct AboutView: View {
    // MARK: - PROPERTIES
    let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
                VStack(alignment: .center, spacing: 5) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100, alignment: .center)
                        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
                    Text("Buzzz".uppercased())
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                }
                .padding()
                
                Form {
                    Section(header: Text(aboutUsText)) {
                        Text(about_us_text)
                        
                    }
                }
            }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

