import Foundation
import UIKit
import PlaygroundSupport

public class SuhurGame: UIView {
    
    var frameWidth = 800
    var frameHeight = 600

    let startButton = UIButton()
    
    let SFRounded = "SF Pro Rounded"
    
    let coundownStartLabel = UILabel()
    var startCountdown:Timer?
    var timeLeft = 3
    
    let timeBackground = UIImageView()
    let scoreBackground = UIImageView()
    let timeLabel = UILabel()
    let scoreLabel = UILabel()
    let timeValue = UILabel()
    let scoreValue = UILabel()
    
    var gameCountdown:Timer?
    var gameTimeLeft = 20
    var scoreTemp = 0
    
    var popUpContainer: UIView = {
        let m_view = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: 600))
        m_view.backgroundColor = Helper.backgroundSuhur
        return m_view
    }()
    
    var buttonNext: UIButton = {
        let startButton = UIButton(frame: CGRect(x: 333, y: 507, width: 115, height: 45))
        startButton.contentMode = .scaleAspectFit
        startButton.setTitle("Continue", for: .normal)
        startButton.backgroundColor = UIColor.gray
//        startButton.frame = CGRect(x: 610, y: 482, width: 115, height: 45)
        startButton.layer.cornerRadius = 10.0
        startButton.backgroundColor = Helper.colorButton
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        return startButton
    }()
    
    var titleEnd = UILabel()
    var descEnd = UILabel()
    var messageEnd = UILabel()
    var titleScoreEnd = UILabel()
    var valueScoreEnd = UILabel()
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        super.backgroundColor = Helper.backgroundSuhur
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        startCountdown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
        coundownStartLabel.text = "\(timeLeft)"
        coundownStartLabel.numberOfLines = 0
        coundownStartLabel.textColor = UIColor.black
        coundownStartLabel.frame = CGRect(x: 331, y: 181, width: 137, height: 238)
        coundownStartLabel.font = UIFont(name: SFRounded, size: 200)
        self.addSubview(coundownStartLabel)

    }
    
    func randomImage() {
        let backgroundImages = ["eat", "drink", "sleep"]
        let activityImage = UIImageView()
        let randomNumber = Int.random(in : 0..<backgroundImages.count) // generating random number
        activityImage.image = UIImage(named: backgroundImages[randomNumber])
        
        let generateX = Int.random(in: (100)..<(frameWidth - 100))
        let generateY = Int.random(in: (100)..<(frameHeight - 100))
        
        activityImage.frame = CGRect(x: Int(generateX), y: Int(generateY), width: 69, height: 69)
        activityImage.contentMode = .scaleAspectFit
        activityImage.alpha = 0
        activityImage.tag = randomNumber

        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected(sender:)))
        activityImage.isUserInteractionEnabled = true
        activityImage.addGestureRecognizer(singleTap)
        
        self.addSubview(activityImage)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            activityImage.alpha = 1
        })
    }
    
    @objc func tapDetected(sender: UITapGestureRecognizer) {
        let tapImage = sender.view
        
        if(gameTimeLeft > 0) {
            if tapImage?.tag == 0 {
                scoreTemp += 3
            } else if tapImage?.tag == 1 {
                scoreTemp += 2
            } else {
                scoreTemp -= 3
            }
            scoreValue.text = "\(scoreTemp)"
            tapImage?.removeFromSuperview()
        }
    }
    
    @objc func onTimerFires()
    {
        timeLeft -= 1
        coundownStartLabel.text = "\(timeLeft)"

        if timeLeft <= 0 {
            startCountdown?.invalidate()
            startCountdown = nil
            coundownStartLabel.removeFromSuperview()
            startGame()
        }
    }
    
    func startGame() {
        gameCountdown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onGameStart), userInfo: nil, repeats: true)
        
        // Time
        timeLabel.text = "Time"
        timeLabel.numberOfLines = 0
        timeLabel.textColor = UIColor.black
        timeLabel.frame = CGRect(x: 54.5, y: 34, width: 47, height: 24)
        timeLabel.font = UIFont(name: SFRounded, size: 20)
        self.addSubview(timeLabel)
        
        timeBackground.image = UIImage(named: "time-background.png")
        timeBackground.frame = CGRect(x: 50, y: 64, width: 167, height: 43)
        timeBackground.contentMode = .scaleAspectFit
        timeBackground.alpha = 1
        self.addSubview(timeBackground)
        
        timeValue.text = "\(gameTimeLeft)"
        timeValue.numberOfLines = 0
        timeValue.textColor = UIColor.black
        timeValue.frame = CGRect(x: 146, y: 74, width: 28, height: 24)
        timeValue.font = UIFont(name: SFRounded, size: 20)
        self.addSubview(timeValue)
        // Time
        
        // Score
        scoreLabel.text = "Score"
        scoreLabel.numberOfLines = 0
        scoreLabel.textColor = UIColor.black
        scoreLabel.frame = CGRect(x: 553, y: 34, width: 55, height: 24)
        scoreLabel.font = UIFont(name: SFRounded, size: 20)
        self.addSubview(scoreLabel)
        
        scoreBackground.image = UIImage(named: "score-background.png")
        scoreBackground.frame = CGRect(x: 553, y: 64, width: 167, height: 43)
        scoreBackground.contentMode = .scaleAspectFit
        scoreBackground.alpha = 1
        self.addSubview(scoreBackground)
        
        scoreValue.text = "0"
        scoreValue.numberOfLines = 0
        scoreValue.textColor = UIColor.black
        scoreValue.frame = CGRect(x: 649, y: 74, width: 55, height: 24)
        scoreValue.font = UIFont(name: SFRounded, size: 20)
        self.addSubview(scoreValue)
        // Score
    }
    
    @objc func onGameStart()
    {
        gameTimeLeft -= 1
        timeValue.text = "\(gameTimeLeft)"
        
        self.randomImage()
        
        if gameTimeLeft <= 0 {
            gameCountdown?.invalidate()
            gameCountdown = nil
            
            gameEnd()
        }
    }
    
    func gameEnd(){
        titleEnd.text = "Woohoo"
        titleEnd.numberOfLines = 0
        titleEnd.textColor = UIColor.black
        titleEnd.frame = CGRect(x: 265, y: 47, width: 300, height: 84)
        titleEnd.font = UIFont(name: SFRounded, size: 70)
        
        descEnd.text = """
        Good job, fajr is coming, and we enough for eat.

        Suhur is regarded by Islamic traditions as a benefit of the blessings in that it allows the person fasting to avoid the crankiness or the weakness caused by the fast.
        """
        descEnd.center = self.center
        descEnd.numberOfLines = 0
        descEnd.textColor = UIColor.black
        descEnd.frame = CGRect(x: 76, y: 120, width: 649, height: 200)
        descEnd.font = UIFont(name: "Arial", size: 18)
        
        titleScoreEnd.text = "Score"
        titleScoreEnd.numberOfLines = 0
        titleScoreEnd.textColor = UIColor.black
        titleScoreEnd.frame = CGRect(x: 360, y: 363, width: 80, height: 21)
        titleScoreEnd.font = UIFont(name: SFRounded, size: 20)
        
        valueScoreEnd.text = "\(scoreTemp)"
        valueScoreEnd.numberOfLines = 0
        valueScoreEnd.textColor = UIColor.black
        valueScoreEnd.frame = CGRect(x: 378, y: 404, width: 61, height: 30)
        valueScoreEnd.font = UIFont(name: SFRounded, size: 20)
        
            
        self.addSubview(popUpContainer)
        self.addSubview(titleEnd)
        self.addSubview(descEnd)
        self.addSubview(titleScoreEnd)
        self.addSubview(valueScoreEnd)
        self.addSubview(buttonNext)
    }
    
    @objc func startButtonPressed(sender: UIButton) {
        nextScreen()
    }

    func nextScreen() {
        self.removeFromSuperview()
        let mainMenu = MainMenu(scene: self)
        PlaygroundPage.current.liveView = mainMenu
    }
}
