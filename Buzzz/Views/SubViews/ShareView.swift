//
//  ShareView.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI

struct ShareView: View {
    var body: some View {
        ZStack{
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
                } // Social Links
            }
        }
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}
