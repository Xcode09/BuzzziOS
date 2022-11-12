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
//                    Text("About The Bee".uppercased())
//                        .font(.system(.title, design: .rounded))
//                        .fontWeight(.bold)
                }
                .padding()
                
                Form {
                    Section(header: Text(aboutSocialLinksText)) {
                        HStack {
                            // MARK: MAIL
                            if (!station_email.isEmpty) {
                                Button(action: {
                                    openMail()
                                }) {
                                    HStack() {
                                        Image("email")
                                    }
                                }.buttonStyle(PlainButtonStyle())
                                .frame(maxWidth: .infinity)
                            }
                            
                            // MARK: WEBSITE
                            if (!station_website.isEmpty) {
                                Button(action: {
                                    openWebsite()
                                }) {
                                    HStack() {
                                        Image("global")
                                    }
                                }.buttonStyle(PlainButtonStyle())
                                .frame(maxWidth: .infinity)
                            }
                            
                            // MARK: INSTAGRAM
                            if (!instagram_username.isEmpty) {
                                Button(action: {
                                    openInstagram()
                                }) {
                                    HStack() {
                                        Image("instagram")
                                    }
                                }.buttonStyle(PlainButtonStyle())
                                .frame(maxWidth: .infinity)
                            }
                            
                            // MARK: FACEBOOK
                            if (!facebook_profile_id.isEmpty) {
                                Button(action: {
                                   openFacebook()
                                }) {
                                    HStack() {
                                        Image("facebook")
                                    }
                                }.buttonStyle(PlainButtonStyle())
                                .frame(maxWidth: .infinity)
                            }
                            
                            // MARK: TWITTER
    //                            if (!twitter_username.isEmpty) {
    //                                Button(action: {
    //                                    openTwitter()
    //                                }) {
    //                                    HStack() {
    //                                        Image("twitter")
    //                                    }
    //                                }.buttonStyle(PlainButtonStyle())
    //                                .frame(maxWidth: .infinity)
    //                            }
                            
                            // MARK: YOUTUBE
                            if (!youtube_username.isEmpty) {
                                Button(action: {
                                   openYoutube()
                                }) {
                                    HStack() {
                                        Image("youtube")
                                    }
                                }.buttonStyle(PlainButtonStyle())
                                .frame(maxWidth: .infinity)
                            }
                           
                            // MARK: WHATSAPP
                            if (!whatsapp_number.isEmpty) {
                                Button(action: {
                                   openWhatsapp()
                                }) {
                                    HStack() {
                                        Image("whatsapp")
                                    }
                                }.buttonStyle(PlainButtonStyle())
                                .frame(maxWidth: .infinity)
                            }
                            
                        }
                    }
                    
                    Section {
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

