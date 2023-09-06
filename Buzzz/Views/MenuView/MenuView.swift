//
//  MenuView.swift
//  Buzzz
//
//  Created by Berisco Pvt on 23/08/2023.
//

import Foundation
import SwiftUI
import MediaPlayer

struct MenuView:View
{
    @Binding var isOpenMenu:Bool
    
    @Binding var selectedItem:MenuItems?
    
    let menuItems = MenuItems.allCases
    
    var body: some View
    {
        GeometryReader {
            proxy in
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .center)
                    .modifier(LogoModifier())
                HStack{
                    Text("Menu")
                        .font(.system(size: 18,weight: .bold))
                        .frame(maxWidth:.infinity,alignment: .leading)
                        .foregroundColor(.white)
                    Spacer()
                    
                    Button {
                        withAnimation {
                            
                            isOpenMenu.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 18,weight: .bold))
                    }
                    .foregroundColor(.white)

                }
                
                ScrollView {
                    VStack(alignment: .leading){
                        ForEach(menuItems) {
                            item in
                            HStack(spacing:10){
                                Image(item.title)
                                    .resizable()
                                    .frame(width:24,height:24)
                                
                                Text(item.title)
                                    .font(.system(size: 18,weight: .regular))
                                    .frame(maxWidth:.infinity,alignment: .leading)
                                    .foregroundColor(.white)
                            }
                            .padding(15)
                            .onTapGesture {
                                self.selectedItem = item
                                withAnimation {
                                    isOpenMenu = false
                                }
                                
//                                if selectedItem == .share {
//                                    //actionSheet()
//                                }
                            }
                            
                        }
                        
                        
                    }
                }
            }
            .padding()
            .frame(width:proxy.size.width * 0.7,height: proxy.size.height)
            .background(Color.black.opacity(0.9))
        }
        
        
    }
    
//    func actionSheet()
//    {
//        guard let data = URL(string: "www.thebuzzz.com.au") else { return }
//        let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
//        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
//    }
}

struct ActivityViewController: UIViewControllerRepresentable {

    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}

extension MPVolumeView {
    static func setVolume(_ volume: Float) -> Void {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}
