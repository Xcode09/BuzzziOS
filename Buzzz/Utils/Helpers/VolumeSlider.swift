//
//  VolumeSlider.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI
import MediaPlayer
import UIKit

struct VolumeSlider: UIViewRepresentable {

    func makeUIView(context: Context) -> MPVolumeView {
        let view  = MPVolumeView(frame: .zero)
        if let routeButton = view.subviews.compactMap({ $0 as? UIButton }).first,
            let image = routeButton.image(for: .normal) {
            routeButton.setImage(image.withRenderingMode(.alwaysTemplate), for: [])
        }
        
        return view
    }

    func updateUIView(_ view: MPVolumeView, context: Context) {}
}
