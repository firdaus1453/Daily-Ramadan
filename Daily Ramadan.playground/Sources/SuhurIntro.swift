import Foundation
import UIKit
import PlaygroundSupport

public class SuhurIntro: UIView {
    
    var frameWidth = 800
    var frameHeight = 600

    let introLabel = UILabel()
    let startButton = UIButton()
    let descSuhur = UILabel()
    let infoSuhur = UILabel()
    let infoIcon = UIImageView()
    
    let pointLabel = UILabel()
    
    let eatImage = UIImageView()
    let eatPoint = UILabel()
    let eatTitle = UILabel()
    
    let drinkImage = UIImageView()
    let drinkPoint = UILabel()
    let drinkTitle = UILabel()
    
    let sleepImage = UIImageView()
    let sleepPoint = UILabel()
    let sleepTitle = UILabel()
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        super.backgroundColor = Helper.backgroundSuhur
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        let SFRounded = "SF Pro Rounded"
                
        introLabel.text = "Suhur"
        introLabel.numberOfLines = 0
        introLabel.textColor = UIColor.black
        introLabel.frame = CGRect(x: 303, y: 39, width: 196, height: 84)
        introLabel.font = UIFont(name: SFRounded, size: 70)
        self.addSubview(introLabel)
        
        descSuhur.text = "Suhur is time for us to wake up early morning and eat before dawn."
        descSuhur.numberOfLines = 0
        descSuhur.textColor = UIColor.black
        descSuhur.frame = CGRect(x: 130, y: 167, width: 649, height: 42)
        descSuhur.font = UIFont(name: SFRounded, size: 18)
        self.addSubview(descSuhur)
        
        infoSuhur.text = "Tap on the object to do activity"
        infoSuhur.numberOfLines = 0
        infoSuhur.textColor = UIColor.black
        infoSuhur.frame = CGRect(x: 202, y: 235, width: 300, height: 21)
        infoSuhur.font = UIFont(name: SFRounded, size: 18)
        self.addSubview(infoSuhur)
        
        infoIcon.image = UIImage(named: "eat.png")
        infoIcon.frame = CGRect(x: 480, y: 217, width: 92, height: 62)
        infoIcon.contentMode = .scaleAspectFit
        infoIcon.alpha = 1
        self.addSubview(infoIcon)
        
        pointLabel.text = "Point Activity"
        pointLabel.numberOfLines = 0
        pointLabel.textColor = UIColor.black
        pointLabel.frame = CGRect(x: 341, y: 300, width: 118, height: 21)
        pointLabel.font = UIFont(name: SFRounded, size: 18)
        self.addSubview(pointLabel)
        
//        EAT SECTION
        eatImage.image = UIImage(named: "eat.png")
        eatImage.frame = CGRect(x: 171, y: 362, width: 92, height: 62)
        eatImage.contentMode = .scaleAspectFit
        eatImage.alpha = 1
        self.addSubview(eatImage)
        
        eatPoint.text = "+3"
        eatPoint.numberOfLines = 0
        eatPoint.textColor = UIColor.black
        eatPoint.frame = CGRect(x: 281, y: 379, width: 32, height: 29)
        eatPoint.font = UIFont(name: SFRounded, size: 24)
        self.addSubview(eatPoint)
        
        eatTitle.text = "Eat"
        eatTitle.numberOfLines = 0
        eatTitle.textColor = UIColor.black
        eatTitle.frame = CGRect(x: 203.5, y: 447, width: 30, height: 21)
        eatTitle.font = UIFont(name: "Arial", size: 18)
        self.addSubview(eatTitle)
//        EAT SECTION
        
//        Drink SECTION
        drinkImage.image = UIImage(named: "drink.png")
        drinkImage.frame = CGRect(x: 367, y: 363, width: 39, height: 62)
        drinkImage.contentMode = .scaleAspectFit
        drinkImage.alpha = 1
        self.addSubview(drinkImage)
        
        drinkPoint.text = "+2"
        drinkPoint.numberOfLines = 0
        drinkPoint.textColor = UIColor.black
        drinkPoint.frame = CGRect(x: 423.5, y: 381, width: 118, height: 21)
        drinkPoint.font = UIFont(name: SFRounded, size: 24)
        self.addSubview(drinkPoint)
        
        drinkTitle.text = "Drink"
        drinkTitle.numberOfLines = 0
        drinkTitle.textColor = UIColor.black
        drinkTitle.frame = CGRect(x: 365, y: 447, width: 44, height: 21)
        drinkTitle.font = UIFont(name: "Arial", size: 18)
        self.addSubview(drinkTitle)
//        Drink SECTION
        
//        Sleep SECTION
        sleepImage.image = UIImage(named: "sleep.png")
        sleepImage.frame = CGRect(x: 515, y: 372, width: 69, height: 62.93)
        sleepImage.contentMode = .scaleAspectFit
        sleepImage.alpha = 1
        self.addSubview(sleepImage)
        
        sleepPoint.text = "-3"
        sleepPoint.numberOfLines = 0
        sleepPoint.textColor = UIColor.black
        sleepPoint.frame = CGRect(x: 604.5, y: 380, width: 33, height: 29)
        sleepPoint.font = UIFont(name: SFRounded, size: 24)
        self.addSubview(sleepPoint)
        
        sleepTitle.text = "Sleep"
        sleepTitle.numberOfLines = 0
        sleepTitle.textColor = UIColor.black
        sleepTitle.frame = CGRect(x: 526.5, y: 447, width: 47, height: 21)
        sleepTitle.font = UIFont(name: "Arial", size: 18)
        self.addSubview(sleepTitle)
//        Sleep SECTION

        startButton.setTitle("Play", for: .normal)
        startButton.backgroundColor = UIColor.gray
        startButton.frame = CGRect(x: 343, y: 507, width: 115, height: 45)
        startButton.titleLabel?.font = UIFont(name: SFRounded, size: 18)
        startButton.layer.cornerRadius = 10.0
        startButton.backgroundColor = Helper.colorButton
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        self.addSubview(startButton)

    }
    @objc func startButtonPressed(sender: UIButton) {
        nextScreen()
    }

    func nextScreen() {
        self.stopBgSound()
        self.removeFromSuperview()
        let gameSuhur = SuhurGame(scene: self)
        PlaygroundPage.current.liveView = gameSuhur
    }
}
