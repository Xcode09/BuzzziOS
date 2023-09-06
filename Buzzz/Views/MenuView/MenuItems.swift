//
//  MenuItems.swift
//  Buzzz
//
//  Created by Berisco Pvt on 23/08/2023.
//

import Foundation
import SwiftUI
enum MenuItems:String, Identifiable,CaseIterable
{
    case liveStation
    case infoContact
    case songRequest
    case stationWebsite
    case Facebook
    case Instgram
    case joinHive
    case adversite
    case share
    var id:String { return rawValue }
    
    var title:String {
        switch self {
            
        case .liveStation:
            return "Live Stream"
        case .infoContact:
            return "Info & Contact"
        case .songRequest:
            return "Song request"
        case .stationWebsite:
            return "Station website"
        case .Facebook:
            return "Facebook"
        case .Instgram:
            return "Instagram"
        case .joinHive:
            return "Join the Hive"
        case .adversite:
            return "Advertise"
        case .share:
            return "Share"
        }
    }
}
