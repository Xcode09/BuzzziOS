//
//  BuzzCarPlayManager.swift
//  Buzzz
//
//  Created by MacBook Pro on 03/11/2022.
//

import Foundation
/*
Abstract:
`BuzzCarPlayManager` manages the CPTemplates that display in Carplay Music.
*/

import CarPlay
import Foundation
import os
import MediaPlayer

/// `BuzzCarPlayManager` manages the CarPlay connections and templates.
class BuzzCarPlayManager: NSObject {

    /// A reference to the CPInterfaceController that passes in after connecting to CarPlay.
    private var carplayInterfaceController: CPInterfaceController?
    
    /// The CarPlay session configuation contains information on restrictions for the specified interface.
    var sessionConfiguration: CPSessionConfiguration!
    
    // MARK: CPTemplateApplicationSceneDelegate
    
    /// Connects the root template to the CPInterfaceController.
    ///
    var playerViewModel =  PlayerViewModel()
    
    
    func connect(_ interfaceController: CPInterfaceController) {
        
        carplayInterfaceController = interfaceController
        carplayInterfaceController!.delegate = self
        sessionConfiguration = CPSessionConfiguration(delegate: self)
        self.carplayInterfaceController!.delegate = self
        //CarplayPlayerDataStore.shared.configurePlayer()
        self.carplayInterfaceController?.setRootTemplate(loadList(), animated: true,completion: { success, error in
            if error != nil {
                print(error?.localizedDescription)
            }
            debugPrint(success)
        })
    }
    
    private func loadList() -> CPListTemplate{
        var listItem = [CPListItem]()
        let shared = CPNowPlayingTemplate.shared
        let cpList = CPListItem(text: station_title, detailText: station_desc)
        cpList.userInfo = station_streamURL
        cpList.handler = {
            [weak self] selectItem,completion in
            
            debugPrint("CPLIST ITEM",cpList.userInfo as! String)
            
            let station = Station(title: cpList.text ?? "", streamURL: cpList.userInfo as! String, desc: cpList.detailText ?? "")
            self?.playerViewModel.station = station
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                [weak self] in
                
                self?.carplayInterfaceController?.pushTemplate(shared, animated: true)
                completion()
            }
            
        }
        listItem.append(cpList)
        let section = CPListSection(items: listItem)
        
        let listTemplate = CPListTemplate(title: "Play Buzzz",
                                          sections: [section])
        return listTemplate
    }
    
  
    
    /// Called when CarPlay disconnects.
    func disconnect() {
        //playerViewModel = nil
        MPMusicPlayerController.applicationQueuePlayer.pause()
    }

}

extension BuzzCarPlayManager: CPNowPlayingTemplateObserver {
    func nowPlayingTemplateUpNextButtonTapped(_ nowPlayingTemplate: CPNowPlayingTemplate) {

    }
    
    func nowPlayingTemplateAlbumArtistButtonTapped(_ nowPlayingTemplate: CPNowPlayingTemplate) {
        // If a user taps the AlbumArtistButton, a search for songs from that artist begins.
        
    }
}

extension BuzzCarPlayManager: CPInterfaceControllerDelegate {
    func templateWillAppear(_ aTemplate: CPTemplate, animated: Bool) {
//        MemoryLogger.shared.appendEvent("Template \(aTemplate.classForCoder) will appear.")
    }

    func templateDidAppear(_ aTemplate: CPTemplate, animated: Bool) {
//        MemoryLogger.shared.appendEvent("Template \(aTemplate.classForCoder) did appear.")
    }

    func templateWillDisappear(_ aTemplate: CPTemplate, animated: Bool) {
//        MemoryLogger.shared.appendEvent("Template \(aTemplate.classForCoder) will disappear.")
    }

    func templateDidDisappear(_ aTemplate: CPTemplate, animated: Bool) {
//        MemoryLogger.shared.appendEvent("Template \(aTemplate.classForCoder) did disappear.")
    }
}

extension BuzzCarPlayManager: CPSessionConfigurationDelegate {
    func sessionConfiguration(_ sessionConfiguration: CPSessionConfiguration,
                              limitedUserInterfacesChanged limitedUserInterfaces: CPLimitableUserInterface) {
//        MemoryLogger.shared.appendEvent("Limited UI changed: \(limitedUserInterfaces)")
    }
}

extension BuzzCarPlayManager {
    
    /// Starts a search with the title of the list item.
    func searchHandlerForItem(listItem: CPListItem) {
        
    }
    

}
