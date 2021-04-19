/*:
 # Hello There 🙌🏻
 
 Hope you're safe and doing great for this special month.

 More than 1.5 billion Muslims from around the world doing fasting, in April 2021, through this game I would like to provide information about how the experiences of people who fast in the month of Ramadan.

 In this game there will be 3 sessions according to the daily routine taught in Islam, each session the player will play game about choosing what activity is good to do, the better the activity, the more score will be obtained.
 */

import UIKit
import PlaygroundSupport

setFont()
var view = UIView()
var welcomeView = FastingGame(scene: view)

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = welcomeView
