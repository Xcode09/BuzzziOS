//
//  StationViewRow.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI

struct StationViewRow: View {
    var station:Station
    var body: some View {
        HStack{
            Image("logo")
                .resizable()
                .frame(width: 50,height: 50)
            VStack(alignment: .leading, spacing:8){
                Text(station.title)
                    .minimumScaleFactor(0.8)
                    .lineLimit(2)
                    .font(.system(size: 22,weight: .bold))
                Text(station.desc)
            }
            .padding()
//            Spacer()
//            Image(systemName: "play")
//                .frame(width:50,height: 50)
//                .scaledToFill()
//                .padding()
        }
        .frame(width:UIScreen.main.bounds.width - 20,height: 100,alignment: .leading)
        .frame(width:UIScreen.main.bounds.width - 20,height: 100,alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemGroupedBackground)))
        //.padding()
        
    }
}

struct StationViewRow_Previews: PreviewProvider {
    static var previews: some View {
        StationViewRow(station: .init(title: "Dummy", streamURL: "Dummy", desc: "Bla Bla"))
    }
}
