//
//  Config.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import Foundation
import UIKit

// MARK: - ADMOB
// Enable/Disable Admob (Set it false if you don't want to show ads)
let showAds = false
// TODO: Replace by your admob banner ID
// TODO: You should also replace ID in Info.plist file, for more detail plase read user manual
//---GOOGLE ADMOB AND IN-APP PURCHASE IDS HERE---//
let adMobBannerID = ""

// ----------------------------------------------------------------------------------------------

// STATION
let station_title = "the buzzz"
let station_streamURL = "http://c22.radioboss.fm:8205/stream"

let station_desc = "Classic Hits from the 70s and 80s!"

// ----------------------------------------------------------------------------------------------
// MARK: MAIN Screen
// Artwork Album Photo Size
let artworkSize:CGFloat = 250

// Show background image
// Show image in the player background, it is optional. You can set true to enable, false to disable it.
let showBackgroundImage = true

// ----------------------------------------------------------------------------------------------

// MARK: Recording
// Enable/Disable Recording Feature
let showRecordingFeature = false

// ----------------------------------------------------------------------------------------------

// MARK: Sleep Timer
// Enable/Disable Sleep Feature
let showSleepTimerFeature = true

// Sleep Timer Style
// 0 -> Minute List
// 1 -> Circular Minute Picker
let sleepTimerDesign = 1

// ----------------------------------------------------------------------------------------------

// MARK: Share
// Enable/Disable Share Feature
let showShareFeature = true

// Sharing configurations
let shareMessage: String = ""
let shareURL: String = "" /// You can update this link with your App Store link

// ----------------------------------------------------------------------------------------------

// MARK: About Us
// Enable/Disable About Us Feature
let showAboutUsFeature = true

// Social Links
let station_website = "www.thebuzzz.com.au"
let station_email = "thebuzzzaustralia@gmail.com" //lismore@localsounds.com.au"
let youtube_username = ""
let facebook_profile_id = "https://facebook.com/thebuzzzradioonline"
//"https://www.facebook.com/localsoundsradio" //"111802411395708" /// You can use https://findmyfbid.com/ to find the Facebook Profile ID
let instagram_username = "buzzz.radio"
let twitter_username = "LocalSounds"
let whatsapp_number = ""

// If you don't want to show it in the about page, just don't enter a value like below. DO NOT remove the the all line
// let twitter_username = "" // Example for not showing
// let whatsapp_number = "" // Example for not showing

// About Us
let about_us_text = """
The Buzzz is Melbourne’s Home of Classic Hits!

The station launched in 2016 as purely a 70s and 80s music platform, and has since grown to include a quality team of on-air announcers, a true connection to a local audience, and a super cool A-Z playlist of classic tracks you can sing along to – from ABBA to ZZ Top.

The station can be accessed via www.thebuzzz.com.au; the buzzz app; myTuner; TuneIn; Apple CarPlay; Sonos and other Smart Speakers.
"""
// ----------------------------------------------------------------------------------------------

// MARK: - TEXTS
// MARK: Texts in About Us Screen
let aboutSocialLinksText = "CONNECT WITH ME"
let aboutUsText = "ABOUT THE BEE"

// MARK: Texts in Sleep Timer Screen
let sleepTimerText = "Sleep Timer"
let turnTheRadioInText = "Turn the radio off in"
let minutesText = "minutes"
let setTimerStartText = "Start"

// MARK: Texts in Recordings Screen
let recordingsText = "Recordings"
let recordingsDetailText = "You can record the stream"
let recordingsEnterNameText = "Enter Record Name Here"
let recordingsSaveRecordText = "Save Record"

// MARK: Texts
let copiedToClipboardText = "Copied to Clipboard!"


var goalableStation: Station = Station(
    title: station_title,
    streamURL: station_streamURL,
    desc: station_desc
)
