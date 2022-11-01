//
//  Extensions.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import Foundation
import UIKit
import SwiftUI

extension String {

   func widthOfString(usingFont font: UIFont) -> CGFloat {
       let fontAttributes = [NSAttributedString.Key.font: font]
       let size = self.size(withAttributes: fontAttributes)
       return size.width
   }

   func heightOfString(usingFont font: UIFont) -> CGFloat {
       let fontAttributes = [NSAttributedString.Key.font: font]
       let size = self.size(withAttributes: fontAttributes)
       return size.height
   }

   func sizeOfString(usingFont font: UIFont) -> CGSize {
       let fontAttributes = [NSAttributedString.Key.font: font]
       return self.size(withAttributes: fontAttributes)
   }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}

extension Angle {
    func toSleepMinute() -> Int {
        return (Int((360-self.degrees)/2))
    }
}

extension String: Identifiable {
    public var id: String { self }
}
extension Notification.Name{
    static let playSound = Notification.Name("playSound")
    static let nowPlayingDisappear = Notification.Name("nowPlayingDisappear")
}
