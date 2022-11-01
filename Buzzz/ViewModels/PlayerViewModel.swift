//
//  PlayerViewModel.swift
//  Buzzz
//  Created by Mohammad Ali
//  Copyright © 2022 Mohammad Ali. All rights reserved.
//

import SwiftUI
import AVFoundation
import MediaPlayer



final class PlayerViewModel: NSObject, ObservableObject {
    
    // MARK: - PROPERTIES
    @Published var didSet: Bool = false
    @Published var isPlaying: Bool = false
    @Published var isLoading: Bool = false
    @Published var isSleepMode: Bool = false
    @Published var isRecording: Bool = false
    @Published var track: Track = Track(title: "", artist: "")
    var station:Station = .init(title: "", streamURL: "", desc:"")
    
    // MARK: Radio Player
    private var avPlayer: AVPlayer?
    private var observer: NSKeyValueObservation?
    
    // MARK: Sleep
    private var workItem: DispatchWorkItem?
    
    // MARK: Recording
    var player: AVPlayer!
    //var playerItem: CachingPlayerItem!
    var recordingName: String?
    @Published var recordings : [URL] = []
    
    // MARK: - SETUP
    override init() {
        super.init()
        setupAVAudioSession()
        NotificationCenter.default.addObserver(self,
                                                   selector: #selector(handleInterruption),
                                                   name: AVAudioSession.interruptionNotification,
                                                   object: AVAudioSession.sharedInstance())
        
//        NotificationCenter.default.addObserver(forName: .playSound, object: nil, queue: .main) { [weak self] notification in
//            debugPrint("Receive Notification for station")
//            if let carPlayStation = notification.userInfo?["station"] as? Station{
//                if MPNowPlayingInfoCenter.default().nowPlayingInfo != nil {
//                    self?.stopPlaying()
//                }
//                self?.station = carPlayStation
//
//
//            }
//
//        }
        
//        NotificationCenter.default.addObserver(forName: .nowPlayingDisappear, object: nil, queue: .main) { [weak self] noti in
//            debugPrint("Recevied Disappear Message")
//            self?.stopPlaying()
//        }
    }
    
    @objc func handleInterruption(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
                return
        }
        if type == .began {
            // Interruption began, take appropriate actions (save state, update user interface)
        }
        else if type == .ended {
            guard let optionsValue =
                userInfo[AVAudioSessionInterruptionOptionKey] as? UInt else {
                    return
            }
            let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
            if options.contains(.shouldResume) {
                setupAVAudioSession()
                streamStation(station: station)
            }
        }
    }
    
    private func setupAVAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            debugPrint("AVAudioSession is Active and Category Playback is set")
            UIApplication.shared.beginReceivingRemoteControlEvents()
            setupCommandCenter()
        } catch {
            debugPrint("Error: \(error)")
        }
    }
    
    private func setupCommandCenter() {
        
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.isEnabled = true
        commandCenter.pauseCommand.isEnabled = true
        
        
        commandCenter.playCommand.addTarget { (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus in
            self.stopPlaying()
            self.streamStation(station: self.station)
           return .success
        }
        commandCenter.pauseCommand.addTarget {(MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus in
           self.stopPlaying()
           return .success
        }
    }

    // MARK: - MPNowPlayingInfoCenter (Car Play & Lock Screen)
    func setUpNowPlayingInfo() {
        
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()

        nowPlayingInfo[MPMediaItemPropertyTitle] = track.title
        nowPlayingInfo[MPMediaItemPropertyArtist] = track.artist

        nowPlayingInfo[MPNowPlayingInfoPropertyIsLiveStream] = false
        if let image = track.artworkImage {
            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size, requestHandler: { size -> UIImage in
                return image
            })
        }
        // Set the metadata
        MPNowPlayingInfoCenter.default().playbackState = .playing
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    
    // MARK: - CONTROLLERS
    
    func streamStation(station: Station) {
        self.didSet = true
        self.track = Track(title:station.title, artist:"")
        
        // Set MPNowPlayingInfoCenter title
        self.setUpNowPlayingInfo()
            
        // Meta data
        
        guard let url = URL(string:station.streamURL)
        else {
            return
        }
        let asset = AVAsset(url:url)
        let playerItem = AVPlayerItem(asset: asset)
        let metadataOutput = AVPlayerItemMetadataOutput(identifiers: nil)
        metadataOutput.setDelegate(self, queue: DispatchQueue.main)
        playerItem.add(metadataOutput)
        
        // Player
        avPlayer = AVPlayer(playerItem: playerItem)
        avPlayer?.play()
        self.isLoading = true
        

        // Register as an observer of the player item's timeControlStatus property
        self.observer = avPlayer?.observe(\.timeControlStatus, options:  [.new, .old], changeHandler: { (avPlayer, change) in
            if avPlayer.timeControlStatus == .playing {
                self.isLoading = false
                self.isPlaying = true
            }
        })
    }
    
    func togglePlaying() {
        if self.isPlaying {
            avPlayer?.pause()
            avPlayer = nil
        } else {
            streamStation(station: station)
        }
        self.isPlaying.toggle()
    }
    
    func stopPlaying() {
        avPlayer?.pause()
        self.isPlaying = false
        self.track = .init(title: "", artist: "")
        self.didSet = false
//        MPNowPlayingInfoCenter.default().playbackState = .interrupted
//        MPNowPlayingInfoCenter.default().nowPlayingInfo = nil
    }
    
    // MARK: - SLEEP TIMER
    
    func setTimer(countDown: Int) {
        isSleepMode = true
        
        workItem = DispatchWorkItem(block: {
            self.avPlayer?.pause()
            self.isPlaying = false
        })
        let delayInSecond: Double = Double(countDown * 60)
        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSecond, execute: workItem!)
    }
    
    func disableSleepMode() {
        isSleepMode = false
        workItem?.cancel()
    }
    
    deinit {
//        self.track = .init(title: "", artist: "")
//        self.didSet = false
//        self.stopPlaying()
        //NotificationCenter.default.removeObserver(self)
    }
}

extension PlayerViewModel: AVPlayerItemMetadataOutputPushDelegate {
    
    func metadataOutput(_ output: AVPlayerItemMetadataOutput, didOutputTimedMetadataGroups groups: [AVTimedMetadataGroup], from track: AVPlayerItemTrack?) {
        
        if let item = groups.first?.items.first // make this an AVMetadata item
        {
            let metaTitle = (item.value(forKeyPath: "value")!) as! String
                
            // Split metatitle into asong and artist
            let words = metaTitle.split(separator: "-", maxSplits: 1).map(String.init)

            if words.count > 1 {
                self.track = Track(title: String(words[1].dropFirst()), artist: String(words[0].dropLast()))
            } else {
                self.track = Track(title: metaTitle, artist: "")
            }
            
            // Set MPNowPlayingInfoCenter title
            self.setUpNowPlayingInfo()
            
            // Fetch artwork album
            FRadioAPI.getArtwork(for: metaTitle, size: Int(artworkSize * 2), completionHandler: { [unowned self] artworlURL in
                
                DispatchQueue.main.async {
                    self.track.artworkURL = artworlURL?.absoluteString
    
                    // Fetch image
                    if self.track.artworkURL != nil {
                        DispatchQueue.global().async {
                            if let url = URL(string:self.track.artworkURL!)  {
                                if let data = try? Data.init(contentsOf: url), let image = UIImage(data: data) {
                                    DispatchQueue.main.async {
                                        self.track.artworkImage = image
                                        self.setUpNowPlayingInfo()
                                    }
                                }
                            }
                        }
                    }
                    
                }
            })
        }
    }
}
