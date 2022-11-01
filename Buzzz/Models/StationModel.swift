//
//  StationModel.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import Foundation
struct Station: Codable, Equatable, Hashable {
    var title: String
    var streamURL: String
    var desc: String
}

extension Station{
    static func fetchAllStations()->[Station]
    {
        return [
            .init(title: "station_title", streamURL: "http://c22.radioboss.fm:8205/stream", desc: "station_desc"),
            .init(title: "Local Sounds Armidale", streamURL: "http://c22.radioboss.fm/stream/205", desc: "Better Music for Armidale"),
            .init(title: "Local Sounds South Burnett", streamURL: "http://c22.radioboss.fm/playlist/205/stream.m3u", desc: "Better Music for South Burnett")
        ]
    }
}
