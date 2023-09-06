//
//  SafariView.swift
//  Buzzz
//
//  Created by Berisco Pvt on 23/08/2023.
//

import Foundation
import SafariServices
import SwiftUI

struct SafariView:UIViewControllerRepresentable {
    let url:String
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let SF = SFSafariViewController(url: .init(string: url)!)
        return SF
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        //
    }
    
    typealias UIViewControllerType = SFSafariViewController
    
    
    
    
}
