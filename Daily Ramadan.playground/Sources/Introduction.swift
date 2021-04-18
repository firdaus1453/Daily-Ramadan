import Foundation
import UIKit
import PlaygroundSupport

public class Introduction: UIView {
    
    var frameWidth = 800
    var frameHeight = 600

    let introLabel = UILabel()
    let startButton = UIButton()
    let bannerImage = UIImageView()
    let doodleImage = UIImageView()
    
    
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        
        super.backgroundColor = Helper.colorSky
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        introLabel.text = """
        Hello There 🙌🏻
        
        Hope you're safe and doing great for this special month April 2021.

        This playground is designed and developed to inform users about what activity we do if we fasting in Ramadhan, for now more than 1.5 billion Muslims from around the world doing fasting, so that we can find out the experiences of our friends who are fasting, and we can respect each other to make better world.

        There are 3 session time, with game for select what activity we must do per each session time. Select activity with high score for you complete fasting with awesome.
        """
        introLabel.numberOfLines = 0
        introLabel.textColor = UIColor.black
        introLabel.frame = CGRect(x: 75, y: 196, width: 649, height: 180)
        introLabel.font = UIFont(name: "Arial", size: 15)
        self.addSubview(introLabel)
        
        startButton.setTitle("Continue", for: .normal)
        startButton.backgroundColor = UIColor.gray
        startButton.frame = CGRect(x: 610, y: 482, width: 115, height: 45)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        startButton.layer.cornerRadius = 10.0
        startButton.backgroundColor = Helper.colorButton
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        self.addSubview(startButton)

    }
    @objc func startButtonPressed(sender: UIButton) {
        nextScreen()
    }

    func nextScreen() {
        self.removeFromSuperview()
        let suhurView = SuhurIntro(scene: self)
        PlaygroundPage.current.liveView = suhurView
    }
}
