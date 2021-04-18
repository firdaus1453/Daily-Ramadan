/*:
 # Hello There 🙌🏻

 Hope you're safe and doing great for this special month.

 This playground is designed and developed to inform users about what activity do if we fasting in Ramadhan, from dawn to sunset, so that we can find out the experiences of our friends who are fasting.

 There are 3 session time, with game for select what activity we must do per each session time. Select activity with high score for you complete fasting with awesome.
*/

import UIKit
import PlaygroundSupport

var view = UIView()
var welcomeView = SuhurIntro(scene: view)

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = welcomeView
