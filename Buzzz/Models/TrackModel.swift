//
//  TrackModel.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import Foundation
import UIKit

struct Track {
    var title: String
    var artist: String
    var artworkURL: String?
    var artworkImage: UIImage?
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
    
    func metaTitle() -> String {
        if self.artist.count > 0 {
            return "\(self.artist) - \(self.title)"
        }
        
        return title
    }
}
