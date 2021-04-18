import Foundation
import UIKit
import PlaygroundSupport

public class FastingIntro: UIView {
    
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
    
    let studyImage = UIImageView()
    let studyPoint = UILabel()
    let studyTitle = UILabel()
    
    let exerciseImage = UIImageView()
    let exercisePoint = UILabel()
    let exerciseTitle = UILabel()
    
    let workImage = UIImageView()
    let workPoint = UILabel()
    let workTitle = UILabel()
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        super.backgroundColor = Helper.backgroundFasting
        self.playBgSound()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        let SFRounded = "SF Pro Rounded"
        
        introLabel.text = "Fasting"
        introLabel.numberOfLines = 0
        introLabel.textAlignment = .center
        introLabel.textColor = UIColor.black
        introLabel.frame = CGRect(x: 283, y: 39, width: 250, height: 84)
        introLabel.font = UIFont(name: SFRounded, size: 70)
        self.addSubview(introLabel)
        
        descSuhur.text = "We are now fasting, don't eat and drink, but we must do usefull activity."
        descSuhur.numberOfLines = 0
        descSuhur.textColor = UIColor.black
        descSuhur.frame = CGRect(x: 120, y: 167, width: 680, height: 42)
        descSuhur.font = UIFont(name: SFRounded, size: 18)
        self.addSubview(descSuhur)
        
        infoSuhur.text = "Tap on the object to do activity."
        infoSuhur.numberOfLines = 0
        infoSuhur.textColor = UIColor.black
        infoSuhur.frame = CGRect(x: 250, y: 235, width: 300, height: 21)
        infoSuhur.font = UIFont(name: SFRounded, size: 18)
        self.addSubview(infoSuhur)
        
        infoIcon.image = UIImage(named: "study.png")
        infoIcon.frame = CGRect(x: 506, y: 217, width: 92, height: 62)
        infoIcon.contentMode = .scaleAspectFit
        infoIcon.alpha = 1
        self.addSubview(infoIcon)
        
        pointLabel.text = "Point Activity"
        pointLabel.numberOfLines = 0
        pointLabel.textColor = UIColor.black
        pointLabel.frame = CGRect(x: 348, y: 300, width: 118, height: 21)
        pointLabel.font = UIFont(name: SFRounded, size: 18)
        self.addSubview(pointLabel)
        
//        study SECTION
        studyImage.image = UIImage(named: "study.png")
        studyImage.frame = CGRect(x: 40, y: 345, width: 92, height: 62)
        studyImage.contentMode = .scaleAspectFit
        studyImage.alpha = 1
        self.addSubview(studyImage)
        
        studyPoint.text = "+3"
        studyPoint.numberOfLines = 0
        studyPoint.textColor = UIColor.black
        studyPoint.frame = CGRect(x: 126, y: 362, width: 32, height: 29)
        studyPoint.font = UIFont(name: SFRounded, size: 24)
        self.addSubview(studyPoint)
        
        studyTitle.text = "Make Swift\nStudent Challange"
        studyTitle.textAlignment = .center
        studyTitle.numberOfLines = 0
        studyTitle.textColor = UIColor.black
        studyTitle.frame = CGRect(x: 17.5, y: 432, width: 140, height: 38)
        studyTitle.font = UIFont(name: "Arial", size: 16)
        self.addSubview(studyTitle)
//        study SECTION
        
//        Work SECTION
        workImage.image = UIImage(named: "work.png")
        workImage.frame = CGRect(x: 192.5, y: 345, width: 92, height: 62)
        workImage.contentMode = .scaleAspectFit
        workImage.alpha = 1
        self.addSubview(workImage)
        
        workPoint.text = "+2"
        workPoint.numberOfLines = 0
        workPoint.textColor = UIColor.black
        workPoint.frame = CGRect(x: 290.5, y: 361, width: 32, height: 29)
        workPoint.font = UIFont(name: SFRounded, size: 24)
        self.addSubview(workPoint)
        
        workTitle.text = "Work"
        workTitle.numberOfLines = 0
        workTitle.textColor = UIColor.black
        workTitle.frame = CGRect(x: 217, y: 437, width: 43, height: 21)
        workTitle.font = UIFont(name: "Arial", size: 18)
        self.addSubview(workTitle)
//        Work SECTION
        
//        exercise SECTION
        exerciseImage.image = UIImage(named: "exercise.png")
        exerciseImage.frame = CGRect(x: 349, y: 361, width: 92, height: 36)
        exerciseImage.contentMode = .scaleAspectFit
        exerciseImage.alpha = 1
        self.addSubview(exerciseImage)
        
        exercisePoint.text = "+1"
        exercisePoint.numberOfLines = 0
        exercisePoint.textColor = UIColor.black
        exercisePoint.frame = CGRect(x: 451.5, y: 361, width: 28, height: 29)
        exercisePoint.font = UIFont(name: SFRounded, size: 24)
        self.addSubview(exercisePoint)
        
        exerciseTitle.text = "Exercise"
        exerciseTitle.numberOfLines = 0
        exerciseTitle.textColor = UIColor.black
        exerciseTitle.frame = CGRect(x: 365, y: 439, width: 75, height: 21)
        exerciseTitle.font = UIFont(name: "Arial", size: 18)
        self.addSubview(exerciseTitle)
//        exercise SECTION
        
//        eat SECTION
        eatImage.image = UIImage(named: "eat.png")
        eatImage.frame = CGRect(x: 506, y: 354, width: 92, height: 62)
        eatImage.contentMode = .scaleAspectFit
        eatImage.alpha = 1
        self.addSubview(eatImage)
        
        eatPoint.text = "-3"
        eatPoint.numberOfLines = 0
        eatPoint.textColor = UIColor.black
        eatPoint.frame = CGRect(x: 608, y: 362, width: 27, height: 29)
        eatPoint.font = UIFont(name: SFRounded, size: 24)
        self.addSubview(eatPoint)
        
        eatTitle.text = "Eat"
        eatTitle.numberOfLines = 0
        eatTitle.textColor = UIColor.black
        eatTitle.frame = CGRect(x: 539, y: 438, width: 40, height: 21)
        eatTitle.font = UIFont(name: "Arial", size: 18)
        self.addSubview(eatTitle)
//        eat SECTION
        
        //        drink SECTION
        drinkImage.image = UIImage(named: "drink.png")
        drinkImage.frame = CGRect(x: 672, y: 345, width: 39, height: 62)
        drinkImage.contentMode = .scaleAspectFit
        drinkImage.alpha = 1
        self.addSubview(drinkImage)
        
        drinkPoint.text = "-3"
        drinkPoint.numberOfLines = 0
        drinkPoint.textColor = UIColor.black
        drinkPoint.frame = CGRect(x: 723, y: 362, width: 33, height: 29)
        drinkPoint.font = UIFont(name: SFRounded, size: 24)
        self.addSubview(drinkPoint)
        
        drinkTitle.text = "Drink"
        drinkTitle.numberOfLines = 0
        drinkTitle.textColor = UIColor.black
        drinkTitle.frame = CGRect(x: 669.5, y: 437, width: 50, height: 29)
        drinkTitle.font = UIFont(name: "Arial", size: 18)
        self.addSubview(drinkTitle)
        //        drink SECTION

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
        let fastingGame = FastingGame(scene: self)
        PlaygroundPage.current.liveView = fastingGame
    }
}
