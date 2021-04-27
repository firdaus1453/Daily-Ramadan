import Foundation
import UIKit
import PlaygroundSupport

public class MainMenu: UIView {
    
    var frameWidth = 800
    var frameHeight = 600

    let startButton = UIButton()

    let cloudImage = UIImageView()
    let bushImage = UIImageView()
    let titleImage = UIImageView()
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        super.backgroundColor = Helper.colorSky
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        cloudImage.image = UIImage(named: "cloud.png")
        cloudImage.frame = CGRect(x: 1, y: -11, width: 826, height: 136)
        cloudImage.contentMode = .scaleAspectFit
        cloudImage.alpha = 1
        self.addSubview(cloudImage)
                
        bushImage.image = UIImage(named: "bush.png")
        bushImage.frame = CGRect(x: 0, y: 387, width: 800.19, height: 213)
        bushImage.contentMode = .scaleAspectFit
        bushImage.alpha = 1
        self.addSubview(bushImage)
        
        titleImage.frame = CGRect(x: 211, y: -84, width: 377, height: 158)
        startButton.frame = CGRect(x: 311, y: 600, width: 178, height: 62)
        UIView.animate(withDuration: 2,
             delay: 0,
             usingSpringWithDamping: 0.8,
             initialSpringVelocity: 0.5,
             animations: {
                self.setupTitle()
                self.setupButtonStart()
                    })
    }
    
    func setupTitle(){
        titleImage.image = UIImage(named: "title-menu.png")
        titleImage.frame = CGRect(x: 211, y: 114, width: 377, height: 158)
        titleImage.contentMode = .scaleAspectFit
        titleImage.alpha = 1
        self.addSubview(self.titleImage)
    }
    
    func setupButtonStart(){
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = UIColor.gray
        startButton.frame = CGRect(x: 311, y: 300, width: 178, height: 62)
        startButton.titleLabel?.font = UIFont(name: "SF Pro Rounded", size: 36)
        startButton.layer.cornerRadius = 10.0
        startButton.backgroundColor = Helper.colorButton
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        self.addSubview(self.startButton)
    }
    @objc func startButtonPressed(sender: UIButton) {
        nextScreen()
    }

    func nextScreen() {
        self.removeFromSuperview()
        
        let intro = Introduction(scene: self)
        PlaygroundPage.current.liveView = intro
    }
}
