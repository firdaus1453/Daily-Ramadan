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
    var gameTimeLeft = 21
    var scoreTemp = 0
    
    var popUpContainer: UIView = {
        let m_view = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: 600))
        m_view.backgroundColor = Helper.backgroundSuhur
        return m_view
    }()
    
    var buttonNext: UIButton = {
        let startButton = UIButton(frame: CGRect(x: 479, y: 510, width: 115, height: 45))
        startButton.contentMode = .scaleAspectFit
        startButton.setTitle("Continue", for: .normal)
        startButton.backgroundColor = UIColor.gray
        startButton.layer.cornerRadius = 10.0
        startButton.backgroundColor = Helper.colorButton
        startButton.titleLabel?.font = UIFont(name: "SF Pro Rounded", size: 18)
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        return startButton
    }()
    
    var buttonRetry: UIButton = {
        let startButton = UIButton(frame: CGRect(x: 207, y: 510, width: 115, height: 45))
        startButton.contentMode = .scaleAspectFit
        startButton.setTitle("Retry", for: .normal)
        startButton.backgroundColor = UIColor.gray
        startButton.layer.cornerRadius = 10.0
        startButton.backgroundColor = Helper.colorButton
        startButton.titleLabel?.font = UIFont(name: "SF Pro Rounded", size: 18)
        startButton.addTarget(self, action: #selector(retryButtonPressed), for: .touchUpInside)
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
        coundownStartLabel.frame = CGRect(x: 245, y: 181, width: 300, height: 238)
        coundownStartLabel.font = UIFont(name: SFRounded, size: 200)
        coundownStartLabel.textAlignment = .center
        self.addSubview(coundownStartLabel)

    }
    
    func randomImage() {
        let backgroundImages = ["eat", "drink", "sleep"]
        let activityImage = UIImageView()
        let randomNumber = Int.random(in : 0..<backgroundImages.count) // generating random number
        activityImage.image = UIImage(named: backgroundImages[randomNumber])
        
        let generateX = Int.random(in: 100..<(frameWidth - 100))
        let generateY = Int.random(in: 120..<(frameHeight - 100))
        
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
                self.CorrectSound()
                scoreTemp += 3
            } else if tapImage?.tag == 1 {
                self.CorrectSound()
                scoreTemp += 2
            } else {
                self.AwSound()
                scoreTemp -= 3
            }
            scoreValue.text = "\(scoreTemp)"
            tapImage?.removeFromSuperview()
        }
    }
    
    @objc func onTimerFires()
    {
        timeLeft -= 1

        if timeLeft <= 0 {
            coundownStartLabel.text = "GO"
            startCountdown?.invalidate()
            startCountdown = nil
            startGame()
        } else {
            coundownStartLabel.text = "\(timeLeft)"
        }
    }
    
    func startGame() {
        self.playGameBgSound()
        gameCountdown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onGameStart), userInfo: nil, repeats: true)
        
        // Time
        timeLabel.text = "Time"
        timeLabel.numberOfLines = 0
        timeLabel.textColor = UIColor.black
        timeLabel.frame = CGRect(x: 104.5, y: 34, width: 47, height: 24)
        timeLabel.font = UIFont(name: SFRounded, size: 20)
        self.addSubview(timeLabel)
        
        timeBackground.image = UIImage(named: "time-background.png")
        timeBackground.frame = CGRect(x: 100, y: 64, width: 167, height: 43)
        timeBackground.contentMode = .scaleAspectFit
        timeBackground.alpha = 1
        self.addSubview(timeBackground)
        
        timeValue.text = "20"
        timeValue.numberOfLines = 0
        timeValue.textColor = UIColor.black
        timeValue.textAlignment = .center
        timeValue.frame = CGRect(x: 146 + 50, y: 74, width: 28, height: 24)
        timeValue.font = UIFont(name: SFRounded, size: 20)
        self.addSubview(timeValue)
        // Time
        
        // Score
        scoreLabel.text = "Score"
        scoreLabel.numberOfLines = 0
        scoreLabel.textColor = UIColor.black
        scoreLabel.frame = CGRect(x: frameWidth - 167 - 100, y: 34, width: 55, height: 24)
        scoreLabel.font = UIFont(name: SFRounded, size: 20)
        self.addSubview(scoreLabel)
        
        scoreBackground.image = UIImage(named: "score-background.png")
        scoreBackground.frame = CGRect(x: frameWidth - 167 - 100, y: 64, width: 167, height: 43)
        scoreBackground.contentMode = .scaleAspectFit
        scoreBackground.alpha = 1
        self.addSubview(scoreBackground)
        
        scoreValue.text = "0"
        scoreValue.numberOfLines = 0
        scoreValue.textAlignment = .center
        scoreValue.textColor = UIColor.black
        scoreValue.frame = CGRect(x: frameWidth - 167 - 55 + 35, y: 74, width: 55, height: 24)
        scoreValue.font = UIFont(name: SFRounded, size: 20)
        self.addSubview(scoreValue)
        // Score
    }
    
    @objc func onGameStart()
    {
        coundownStartLabel.removeFromSuperview()
        gameTimeLeft -= 1
        
        if (gameTimeLeft <= 20) {
            timeValue.text = "\(gameTimeLeft)"
        }
        
        if (gameTimeLeft <= 10) {
            let random = Int.random(in: 1...3)
            for _ in 1...random {
                self.randomImage()
            }
        } else {
            self.randomImage()
        }
        
        if gameTimeLeft == 0 {
           
            gameCountdown?.invalidate()
            gameCountdown = nil
            
            gameEnd()
        }
    }
    
    func gameEnd(){
        self.stopGameBgSound()
        self.WinSound()
        titleEnd.text = "Woohoo"
        titleEnd.numberOfLines = 0
        titleEnd.textColor = UIColor.black
        titleEnd.frame = CGRect(x: 265, y: 47, width: 300, height: 84)
        titleEnd.font = UIFont(name: SFRounded, size: 70)
        
        descEnd.text = """
        Good job, fajr is coming, enough for eat and drink, we are ready for fasting.

        Suhur is regarded by Islamic traditions as a benefit of the blessings in that it allows the person fasting to avoid the crankiness or the weakness caused by the fast.
        """
        descEnd.textAlignment = .center
        descEnd.numberOfLines = 0
        descEnd.textColor = UIColor.black
        descEnd.frame = CGRect(x: 76, y: 120, width: 649, height: 200)
        descEnd.font = UIFont(name: "Arial", size: 18)
        
        titleScoreEnd.text = "Score"
        titleScoreEnd.numberOfLines = 0
        titleScoreEnd.textAlignment = .center
        titleScoreEnd.textColor = UIColor.black
        titleScoreEnd.frame = CGRect(x: 360, y: 363, width: 80, height: 21)
        titleScoreEnd.font = UIFont(name: SFRounded, size: 20)
        
        valueScoreEnd.text = "\(scoreTemp)"
        valueScoreEnd.textAlignment = .center
        valueScoreEnd.numberOfLines = 0
        valueScoreEnd.textColor = UIColor.black
        valueScoreEnd.frame = CGRect(x: 380, y: 404, width: 41, height: 21)
        valueScoreEnd.font = UIFont(name: SFRounded, size: 20)

        self.addSubview(popUpContainer)
        self.addSubview(titleEnd)
        self.addSubview(descEnd)
        self.addSubview(titleScoreEnd)
        self.addSubview(valueScoreEnd)
        self.addSubview(buttonNext)
        self.addSubview(buttonRetry)
    }
    
    @objc func startButtonPressed(sender: UIButton) {
        nextScreen()
    }
    
    @objc func retryButtonPressed(sender: UIButton) {
        retryScreen()
    }

    func nextScreen() {
        self.removeFromSuperview()
        let fastingIntro = FastingIntro(scene: self)
        PlaygroundPage.current.liveView = fastingIntro
    }
    
    func retryScreen() {
        self.playBgSound()
        self.removeFromSuperview()
        let suhurGame = SuhurIntro(scene: self)
        PlaygroundPage.current.liveView = suhurGame
    }
}
