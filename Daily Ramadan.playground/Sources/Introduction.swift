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
        self.playBgSound()
        super.backgroundColor = Helper.colorSky
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        introLabel.text = """
        Hello There 🙌🏻
        
        Hope you're safe and doing great for this special month.

        More than 1.5 billion Muslims from around the world doing fasting, in April 2021, through this game I would like to provide information about how the experiences of people who fast in the month of Ramadan and I hope we can know each other better for more respect and love ❤️.

        In this game there will be 3 sessions according to the daily routine taught in Islam, each session the player will play game about choosing what activity is good to do, the better the activity, the more score will be obtained.
        """
        introLabel.numberOfLines = 0
        introLabel.textColor = UIColor.black
        introLabel.frame = CGRect(x: 75, y: 150, width: 650, height: 300)
        introLabel.font = UIFont(name: "Arial", size: 15)
        self.addSubview(introLabel)
        
        startButton.setTitle("Continue", for: .normal)
        startButton.backgroundColor = UIColor.gray
        startButton.frame = CGRect(x: 610, y: 482, width: 115, height: 45)
        startButton.titleLabel?.font = UIFont(name: "SF Pro Rounded", size: 16)
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
