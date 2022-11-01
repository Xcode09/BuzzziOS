//
//  SocialActions.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import Foundation
import UIKit

func openMail() {
    if let url = URL(string: "mailto:\(station_email)") {
      UIApplication.shared.open(url)
    }
}

func openWebsite() {
    if let url = URL(string: station_website) {
      UIApplication.shared.open(url)
    }
}

func openInstagram() {

    let appURL = URL(string: "instagram://user?username=\(instagram_username)")!
    let application = UIApplication.shared

    if application.canOpenURL(appURL) {
        application.open(appURL)
    } else {
        // if Instagram app is not installed, open URL inside Safari
        let webURL = URL(string: "https://instagram.com/\(instagram_username)")!
        application.open(webURL)
    }
}

func openFacebook() {

    let appURL = URL(string: facebook_profile_id)!
    let application = UIApplication.shared

    if application.canOpenURL(appURL) {
        application.open(appURL)
    } else {
        // if Facebook app is not installed, open URL inside Safari
        let webURL = URL(string: facebook_profile_id)!
        application.open(webURL)
    }
}

func openTwitter() {

    let appURL = URL(string: "twitter://user?screen_name=\(twitter_username)")!
    let application = UIApplication.shared

    if application.canOpenURL(appURL) {
        application.open(appURL)
    } else {
        // if Facebook app is not installed, open URL inside Safari
        let webURL = URL(string: "https://twitter.com/\(twitter_username)")!
        application.open(webURL)
    }
}

func openYoutube() {
    let appURL = NSURL(string: "youtube://www.youtube.com/user/\(youtube_username)")!
    let webURL = NSURL(string: "https://www.youtube.com/user/\(youtube_username)")!
    let application = UIApplication.shared

    if application.canOpenURL(appURL as URL) {
        application.open(appURL as URL)
    } else {
        // if Youtube app is not installed, open URL inside Safari
        application.open(webURL as URL)
    }
}

func openWhatsapp() {
    let urlWhats = "whatsapp://send?phone=\(whatsapp_number)"
    if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
        if let whatsappURL = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(whatsappURL){
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(whatsappURL)
                }
            }
            else {
                print("Install Whatsapp")
            }
        }
    }
}
