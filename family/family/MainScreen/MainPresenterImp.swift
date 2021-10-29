//
//  MainPresenterImp.swift
//  family
//
//  Created by Роман on 28.10.2021.
//

import Foundation
import AVFoundation

protocol MainPresenter {
    
    var screenLogo: MainScreenStates { get set }
    var player: AVAudioPlayer { get }
    
    func viewDidLoad()
    func play()
    func pause()
    func stop()
    func makeScreenShuffle()
    func makeRefreshLogo()
}

class MainPresenterImp: MainPresenter {
    
    weak var view: ViewController?
    var screenLogo = MainScreenStates(rawValue: 0)
    var player = AVAudioPlayer()
    var path = Bundle.main.path(forResource: "song", ofType: "mp3")

    
    init(view: ViewController) {
        self.view = view
    }
    
    func viewDidLoad() {
        let url = URL(fileURLWithPath: path ?? "")
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }
    
    func stop() {
        player.stop()
        player.currentTime = 0
    }
    
    func makeScreenShuffle() {
        let randomValue = Int.random(in: 1...13)
        screenLogo = MainScreenStates(rawValue: randomValue)
    }
    
    func makeRefreshLogo() {
        screenLogo = MainScreenStates(rawValue: 13)
    }
}
