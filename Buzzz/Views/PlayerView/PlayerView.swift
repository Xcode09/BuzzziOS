//
//  PlayerView.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI

struct SelectedURL:Identifiable{
    var id = UUID().uuidString
    let url:String
}

struct PlayerView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @State var adsFlag = false
    @State var isMenuOpen = false
    @State var selectMenuItem : MenuItems?
    @State var isShare  = false
    private var defualtOffset = (UIScreen.main.bounds.width)
    // MARK: - VIEW
    var body: some View {
        ZStack{
            VStack{
                if selectMenuItem == .infoContact {
                    VStack(spacing: 10){
                        Spacer().frame(height:50)
                        
                        Text(aboutSocialLinksText)
                            .frame(maxWidth: .infinity,alignment:.center)
                            .foregroundColor(.black)
                            .font(.system(size: 24,weight: .black))
                            .lineLimit(1)
                            .minimumScaleFactor(0.7)
                            
                        
                        
                        Text(about_us_text)
                            .frame(maxWidth: .infinity,alignment:.center)
                            .foregroundColor(.black)
                            .font(.system(size: 14,weight: .bold))
                            .minimumScaleFactor(0.6)
                            .multilineTextAlignment(.center)
                            
                        
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100, alignment: .center)
                            .modifier(LogoModifier())


                        Spacer()
                            //.frame(height: 30)
                    }
                    .padding(.horizontal,8)
                    
                    //PlayerControlView(selectMenu: $selectMenuItem)
                    
                }else {
                    VStack(alignment: .center, spacing: 10) {
                        Spacer()
                        // MARK: Album Logo Section
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: artworkSize, height: artworkSize, alignment: .center)
                            .modifier(LogoModifier())
                        
                        Spacer()
                        //PlayerControlView(selectMenu: $selectMenuItem)
                        
       
                    } // VStack
                    .padding(.vertical, showAds ? 0 : 20)
                    
                    
                    
                        
                }
                
                
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                getViewBaseOnMenu()
            )
            .overlay(alignment:.top,content: {
                headerView
            })
            .overlay(alignment:.bottom,content: {
                PlayerControlView(selectMenu: $selectMenuItem)
                    //.edgesIgnoringSafeArea(.all)
            })
            
            MenuView(isOpenMenu: $isMenuOpen, selectedItem: $selectMenuItem)
                .offset(x:isMenuOpen ? 0 : -defualtOffset,y: 56)
                .onChange(of: selectMenuItem) { newValue in
                    switch newValue {
                    case .songRequest:
                        //isSafariView = .init(url: "https://thebuzzz.com.au/cindy-daz")
                        
                        UIApplication.shared.open(.init(string: "https://thebuzzz.com.au/cindy-daz")!)
                        
                    case .stationWebsite:
                        //isSafariView = .init(url: "https://thebuzzz.com.au")
                        
                        UIApplication.shared.open(.init(string: "https://thebuzzz.com.au")!)
                    case .Facebook:
                        //isSafariView = .init(url: "https://facebook.com/thebuzzzradioonline")
                        
                        UIApplication.shared.open(.init(string: "https://facebook.com/thebuzzzradioonline")!)
                        
                    case .Instgram:
                        //isSafariView = .init(url: "https://instagram.com/buzzz.radio")
                        
                        UIApplication.shared.open(.init(string: "https://instagram.com/buzzz.radio")!)
             
                    case .joinHive:
                        //isSafariView = .init(url: "https://thebuzzz.com.au/contact-us")
                        UIApplication.shared.open(.init(string: "https://thebuzzz.com.au/contact-us")!)

                    case .adversite:
                        
                        //isSafariView = .init(url: "https://thebuzzz.com.au/advertizzze")
                        
                        UIApplication.shared.open(.init(string: "https://thebuzzz.com.au/advertizzze")!)
                        
                    case .share:
                        isShare.toggle()
            
                    default:
                        break;
                    }
                }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
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
        .sheet(isPresented: $isShare) {
                if #available(iOS 16.0, *) {
                    
                    ActivityViewController(activityItems: [URL(string: "https://thebuzzz.com.au")!]).presentationDetents([.medium])
                } else {
                    // Fallback on earlier versions
                    ActivityViewController(activityItems: [URL(string: "https://thebuzzz.com.au")!])
                }
        }
    }
    
    
    
    var headerView:some View
    {
        HStack{
            Button {
                withAnimation {
                    isMenuOpen.toggle()
                }
                
            } label: {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .scaledToFill()
                
                
            }
            .foregroundColor(.white)
            Spacer()
            Text(selectMenuItem == .infoContact ? selectMenuItem?.title ?? "" : "Live Stream")
                .foregroundColor(.white)
                .font(.title3)
                .bold()
            
            Spacer()

        }
        .padding()
        .frame(height: 56)
        .background {
            Color(AssetsHelper.Colors.HeaderColor.rawValue).ignoresSafeArea()
        }
        .overlay(alignment:.bottom){
            Divider().frame(height:6).overlay {
                Color.white
            }
        }
        
    }
    
    func getViewBaseOnMenu()-> some View{
        
        if selectMenuItem == .infoContact {
            return AnyView(Color.white)
        }else{
            return AnyView(VStack {
                Image("bg1")
                    .resizable()
                    .frame(height:UIScreen.main.bounds.height * 0.8)
                    .scaledToFit()
                    //.offset(y:30)
                    //.aspectRatio(contentMode: .fill)
                    //.edgesIgnoringSafeArea(.top)
            })
        }
    }
}



struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
