//
//  ViewController.swift
//  pictionaryTimer
//
//  Created by Douglas O'Meara on 5/17/17.
//  Copyright © 2017 Douglas O'Meara. All rights reserved.
//

import UIKit
import AVFoundation

var numCorrectTeam1 = 0 //global for end of game conditions
//add this to person object at end of each round to track total corrects and best round

var numCorrectTeam2 = 0

//track individual scores
var currentRound1 = 0
var currentRound2 = 0
var bestRound1 = 0
var bestRound2 = 0
var bestRoundName1 = ""
var bestRoundName2 = ""

//high scores
var highestScore = 0
var highestScoreName = ""
var highestScore2 = 0
var highestScoreName2 = ""


var roundNumber = 0 //track which round it is and which team is scoring

class ViewController: UIViewController {
    
    //array of Object category
    var categoryObjects = ["Sunset", "Link", "Sunglasses", "Ribs", "Dagger", "Chicken Pox", "Shield", "Telescope", "Croissant", "Volcano", "Candlestick", "Crown", "Kayak", "Moat", "Tank", "Family Tree", "Motor", "Lemon", "Robot", "Truck", "Lollipop", "Dumbell", "Curly Fries", "Fountain", "Knee", "Shell", "Hurricane", "Feet", "Wave", "Laptop", "Alarm Clock", "Bow Tie", "Jet", "Stockings", "Piggy Bank", "U-Turn", "Spurs", "Ambulance", "Compass", "Periscope", "Keyboard", "Thermometer", "Cherry", "Microphone", "Comet", "Computer", "Dog Collar", "Subtitles", "Ice Cream Cone", "Lighthouse"]
    //lighthouse = 50
    
    var categoryThings = ["Skunk", "Santa Claus", "Houseboat", "Village", "Lion", "Bearded Lady", "Eiffel Tower", "Shepherd", "Bellboy", "Man on the Moon", "Kangaroo", "Boot Camp", "Gas Station", "Florida", "Pony", "Japan", "Nun", "Lamb", "Snow White", "Hawaii", "Reindeer", "Flying Monkey", "Church", "Shrimp", "Prison", "Dove", "Cupid", "Frog", "Donkey", "King", "Castle", "Peacock", "Robin", "Bald Eagle", "Horsefly", "Atlantic Ocean", "Flamingo", "Knight", "Captain Hook", "Guide Dog", "Archer", "Porcupine", "Shark", "Turantula", "Goldfish", "Igloo", "Great Pyramids", "Swan", "Swordfish", "Polar Bear"]
    //Polar Bear = 50
    
    var categoryAction = ["Bury", "Laugh", "Dye", "Hang", "Read", "Measure", "Hold Up", "Fan", "Inject", "Taste", "Ice Fishing", "Propose Marriage", "Levitate", "Drink", "Save", "Sink", "Shoot", "Bake", "Dig", "Arm Wrestle", "Float", "Cut Corners", "Ram", "Drive", "Blow Up", "Cruise", "Spray", "Dribble", "Bend", "Write", "Shiver", "Soar", "Seperate", "Smile", "Share", "Pause", "Hug", "Sleep", "Scratch", "Vibrate", "Sneak", "Split", "Poke", "Draw", "Punch", "Haunt", "Eat", "Bounce", "Listen", "Shock"]
    //Shock = 50
    
    var categoryDifficult = ["Iced Tea", "Smart Phone", "Homeless", "Flash in the Pan", "The Bee's Knees", "Star Wars", "Drop in the Ocean", "Clean as a Whistle", "Guacamole", "Dimples", "Bird Flu", "Cross Country", "Ponder", "Knot in Your Stomach", "Knuckle Sandwich", "Alive", "Mad Scientist", "Seasick", "Copycat", "Over the Moon"]
    //Over the Moon = 50
    
    
    var seconds = 120
    var timer = Timer()
    var audioPlayer = AVAudioPlayer() //needed for alarm sound
    
    var skipsRemaining = 3
    var skipAttempts = 0 //at end of time or when win condition met, can add this to person object to track their total attempts
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    var randomInt : Int = 0
    var randomCategory : Int = 0
    
    //keep track of how many items have been removed from these arrays
    var objectLoops = 0
    var thingLoops = 0
    var actionLoops = 0
    var difficultLoops = 0
    
    @IBOutlet weak var nextOutlet: UIButton! //need to add action later
    
    @IBOutlet weak var label: UILabel! //time remaining label
    @IBOutlet weak var skipsLabel: UILabel! //skips remaining label
    @IBOutlet weak var scoreLabel: UILabel! //keeps track of score
    
    @IBOutlet weak var statsOutlet: UIButton!
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func start(_ sender: AnyObject)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
        startOutlet.isHidden = true
        correctOutlet.isHidden = false
        skipOutlet.isHidden = false
        
        //generate random number to initialize first word
        randomInt = Int(arc4random_uniform(100)) //generate number between 0-99
        //print(randomInt) //test code- working as intended
        
        if(seconds >= 120) //start should only initialize a word once
        {
            if(randomInt < 30) //category = Object
                {
                    randomCategory = Int(arc4random_uniform(40))
                    wordLabel.text = categoryObjects[randomCategory]
                    categoryObjects.remove(at: randomCategory)
                    objectLoops += 1
                    categoryLabel.text = "Object"
                }
            else if(randomInt >= 30 && randomInt < 60) //category = Thing
                {
                    randomCategory = Int(arc4random_uniform(40))
                    wordLabel.text = categoryThings[randomCategory]
                    categoryThings.remove(at: randomCategory)
                    thingLoops += 1
                    categoryLabel.text = "Person/Place/Animal"
                }
            else if(randomInt >= 60 && randomInt < 90) //category = Action
                {
                    randomCategory = Int(arc4random_uniform(40))
                    wordLabel.text = categoryAction[randomCategory]
                    categoryAction.remove(at: randomCategory)
                    actionLoops += 1
                    categoryLabel.text = "Action"
                }
            else if(randomInt >= 90) //category = difficult
            {
                randomCategory = Int(arc4random_uniform(10))
                wordLabel.text = categoryDifficult[randomCategory]
                categoryDifficult.remove(at: randomCategory)
                difficultLoops += 1
                categoryLabel.text = "Difficult"
            }
        }
    }
    
    func counter()
    {
        seconds -= 1
        label.text = String(seconds) + " seconds"
        
        //if seconds == 10, sound warning alarm
        
        if(seconds == 0)
        {
            timer.invalidate()
            nextOutlet.isHidden = false
            
            audioPlayer.play()
        }
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stop(_ sender: AnyObject)
    {
        timer.invalidate()
        label.text = "Paused"
        
        if(seconds > 0)
        {
            startOutlet.isHidden = false
        }
        
        audioPlayer.stop()
    }
    
    
    @IBOutlet weak var skipOutlet: UIButton!
    @IBAction func skip(_ sender: AnyObject)
    {
        skipAttempts += 1
        
        //seconds = 5
        
        if(roundNumber % 2 == 0 && team1Array[numPlayersTeam1] == "Test")
        {
            seconds = 5
        }
        else if(roundNumber % 2 == 1 && team2Array[numPlayersTeam2] == "Test")
        {
            seconds = 5
        }
        
        if(seconds < 120) //no skipping before round starts
        {
            if(skipsRemaining > 0)
                {
                    skipsRemaining -= 1
                    skipsLabel.text = String(skipsRemaining)
            
                    randomCategory = Int(arc4random_uniform(40))
                    if(categoryLabel.text == "Object")
                        {
                            wordLabel.text = categoryObjects[randomCategory]
                        }
                    else if(categoryLabel.text == "Person/Place/Animal")
                        {
                            wordLabel.text = categoryThings[randomCategory]
                        }
                    else if(categoryLabel.text == "Action")
                        {
                            wordLabel.text = categoryAction[randomCategory]
                        }
                    else if(categoryLabel.text == "Difficult")
                    {
                        randomCategory = Int(arc4random_uniform(10))
                        wordLabel.text = categoryDifficult[randomCategory]
                    }
            
                }
        }
        
        if(skipAttempts == 4)
        {
            skipsLabel.text = "You're out of skips fam"
        }
        
        if(skipAttempts == 5)
        {
            skipsLabel.text = "Bruh"
        }
        
        if(skipAttempts == 6)
        {
            skipsLabel.text = "I'm about to start deducting points"
        }
        
        if(skipAttempts == 7)
        {
            if(roundNumber % 2 == 0)
            {
                skipsLabel.text = "Knock it off " + team1Array[numPlayersTeam1]
            }
            if(roundNumber % 2 == 1)
            {
                skipsLabel.text = "Knock it off " + team2Array[numPlayersTeam2]
            }
            
        }
        
        if(skipAttempts >= 8)
        {
            skipsLabel.text = "10 points from Gryfindor"
            if(roundNumber % 2 == 0) //team 1
            {
                numCorrectTeam1 -= 1
                scoreLabel.text = "Score: " + String(numCorrectTeam1)
            }
            if(roundNumber % 2 == 1) //team 2
            {
                numCorrectTeam2 -= 1
                scoreLabel.text = "Score: " + String(numCorrectTeam2)
            }
        }
    }
    
    
    @IBOutlet weak var correctOutlet: UIButton!
    @IBAction func correct(_ sender: AnyObject)
    {
        let a = categoryObjects.count
        let b = categoryThings.count
        let c = categoryAction.count
        let d = categoryDifficult.count
        
        print(a)
        print(b)
        print(c)
        print(d)
        if(roundNumber % 2 == 0) //team 1
        {
            numCorrectTeam1 += 1
            currentRound1 += 1
            scoreArrayTeam1[numPlayersTeam1] += 1
            scoreLabel.text = "Score: " + String(numCorrectTeam1)
        }
        
        if(roundNumber % 2 == 1) //team 2
        {
            numCorrectTeam2 += 1
            currentRound2 += 1
            scoreArrayTeam2[numPlayersTeam2] += 1
            scoreLabel.text = "Score: " + String(numCorrectTeam2)
        }
        
        
        if(numCorrectTeam1 >= 25)
        {
            categoryLabel.text = "Game Over"
            wordLabel.text = "Team 1 Wins!"
            correctOutlet.isHidden = true
            skipOutlet.isHidden = true
            timer.invalidate()
            startOutlet.isHidden = true
            stopOutlet.isHidden = true
            statsOutlet.isHidden = false
        }
            
        else if(numCorrectTeam2 >= 25)
        {
            categoryLabel.text = "Game Over"
            wordLabel.text = "Team 2 Wins!"
            correctOutlet.isHidden = true
            skipOutlet.isHidden = true
            timer.invalidate()
            startOutlet.isHidden = true
            stopOutlet.isHidden = true
            statsOutlet.isHidden = false
        }
        else
        {
            randomInt = Int(arc4random_uniform(100)) //generate number between 0-99
        
            //get a new word
            if(randomInt < 30) //category = Object
                {
                    randomCategory = Int(arc4random_uniform(UInt32(a)))
                    if(randomCategory > objectLoops)
                        {
                            randomCategory -= objectLoops //keeeps array in bounds
                        }
                    wordLabel.text = categoryObjects[randomCategory]
                    categoryObjects.remove(at: randomCategory)
                    objectLoops += 1
                    categoryLabel.text = "Object"
                }
            else if(randomInt >= 30 && randomInt < 60) //category = Thing
                {
                    randomCategory = Int(arc4random_uniform(UInt32(b)))
                    if(randomCategory > thingLoops)
                        {
                            randomCategory -= thingLoops //keeeps array in bounds
                        }
                    wordLabel.text = categoryThings[randomCategory]
                    categoryThings.remove(at: randomCategory)
                    thingLoops += 1
                    categoryLabel.text = "Person/Place/Animal"
            }
            else if(randomInt >= 60 && randomInt < 90) //category = Action
                {
                    randomCategory = Int(arc4random_uniform(UInt32(c)))
                    if(randomCategory > actionLoops)
                        {
                            randomCategory -= actionLoops //keeeps array in bounds
                        }
                    wordLabel.text = categoryAction[randomCategory]
                    categoryAction.remove(at: randomCategory)
                    actionLoops += 1
                    categoryLabel.text = "Action"
                }
            else if(randomInt >= 90) //category = Difficult
                {
                    randomCategory = Int(arc4random_uniform(UInt32(d)))
                    if(randomCategory > difficultLoops)
                        {
                            randomCategory -= difficultLoops //keeeps array in bounds
                        }
                    wordLabel.text = categoryDifficult[randomCategory]
                    categoryDifficult.remove(at: randomCategory)
                    difficultLoops += 1
                    categoryLabel.text = "Difficult"
                }
        }
    }
    
    @IBAction func nextButton(_ sender: Any)
    {
        performSegue(withIdentifier: "segue", sender: self) //link from Next button to second view is labled "segue"
        audioPlayer.stop()
        
        if(roundNumber % 2 == 0)
        {
            if(currentRound1 > bestRound1)
            {
                bestRound1 = currentRound1
                bestRoundName1 = team1Array[numPlayersTeam1]
            }
            //print(bestRound1)
            //print(bestRoundName1)
            numPlayersTeam1 += 1
            currentRound1 = 0
        }
        else if(roundNumber % 2 == 1)
        {
            if(currentRound2 > bestRound2)
            {
                bestRound2 = currentRound2
                bestRoundName2 = team2Array[numPlayersTeam2]
            }
            numPlayersTeam2 += 1
            currentRound2 = 0
        }
        roundNumber += 1
    }
    
    var index = 0
    @IBAction func statsAction(_ sender: Any)
    {
        //calculate the highest scores and lowest scores here
        
        //finds best score in team 1
        for scores in scoreArrayTeam1
        {
            if(scores == highestScore) //in the event of tie
            {
                highestScoreName += " and " + team1Array[index]
            }
            if(scores > highestScore)
            {
                highestScore = scores
                highestScoreName = team1Array[index]
            }
            index += 1
        }
        
        index = 0 //reset index
        //finds best score in team 2
        for scores in scoreArrayTeam2
        {
            if(scores == highestScore2) //in the event of tie
            {
                highestScoreName2 += " and " + team2Array[index]
            }
            if(scores > highestScore2)
            {
                highestScore2 = scores
                highestScoreName2 = team2Array[index]
            }
            index += 1
        }
        
        if(highestScore2 > highestScore) //if team 2's highest score is bigger
        {
            highestScore = highestScore2 //switch to that high score
            highestScoreName = highestScoreName2 //and name
        }
        
        if(bestRound1 == bestRound2) //tie
        {
            bestRoundName1 += " and " + bestRoundName2
        }
        else if(bestRound2 > bestRound1) //defaults to bestRound1, switch to bestRound2 if higher
        {
            bestRound1 = bestRound2
            bestRoundName1 = bestRoundName2
        }
        
        //print(highestScore)
        //print(highestScoreName)
        performSegue(withIdentifier: "segue3", sender: self)
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nextOutlet.isHidden = true
        correctOutlet.isHidden = true
        statsOutlet.isHidden = true
        skipOutlet.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

