//
//  ViewController.swift
//  family
//
//  Created by Роман on 28.10.2021.
//

import UIKit
import QuartzCore

protocol MainView {
    
}

class ViewController: UIViewController, MainView {
    
    var presenter: MainPresenter!

    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var secondMainView: UIImageView!
    @IBOutlet weak var fisrtMainView: UIImageView!
    @IBAction func playButton(_ sender: UIButton) {
        if !presenter.player.isPlaying {
            setupButtons()
            presenter.play()
            changeScreenLogo()
        }
    }
    @IBAction func stopButton(_ sender: UIButton) {
        if presenter.player.isPlaying {
            setupButtons()
            presenter.stop()
            refreshImage()
        }
    }
    @IBAction func pauseButton(_ sender: UIButton) {
        if presenter.player.isPlaying {
            setupButtons()
            presenter.pause()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        MainConfigurator.configure(view: self)
        presenter.viewDidLoad()
        secondMainView.isHidden = true
    }
    
    func setupButtons() {
        if presenter.player.isPlaying {
            playButton.setImage(UIImage(named: "continuePlay"), for: .normal)
        } else {
            playButton.setImage(UIImage(named: "playButton"), for: .normal)
        }
    }
    
    func changeScreenLogo() {
        if presenter.player.isPlaying {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.secondMainView.layer.opacity = 1.0
                self.secondMainView.image = self.fisrtMainView.image
                self.secondMainView.isHidden = false
                self.presenter.makeScreenShuffle()
                self.fisrtMainView.image = self.presenter.screenLogo.screenImage
                self.hideViewWithAnimate(view: self.secondMainView)
            }
        } else {
            self.refreshImage()
        }
    }
    
    func hideViewWithAnimate(view: UIImageView) {
        UIView.animate(withDuration: 1.0, animations: { [weak self] in
            guard self != nil else { return }
            view.layer.opacity = 0.0
        }) { _ in
            view.isHidden = true
            if self.presenter.player.isPlaying {
                self.changeScreenLogo()
            }
        }
    }
    
    func refreshImage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.presenter.makeRefreshLogo()
            self.fisrtMainView.image = self.presenter.screenLogo.screenImage
            self.hideViewWithAnimate(view: self.secondMainView)
        }
    }
}
