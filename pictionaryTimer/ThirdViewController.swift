//
//  ThirdViewController.swift
//  pictionaryTimer
//
//  Created by Douglas O'Meara on 5/18/17.
//  Copyright © 2017 Douglas O'Meara. All rights reserved.
//

import UIKit


class ThirdViewController: UIViewController {
    
    @IBOutlet weak var loveAppOutlet: UILabel!
    
    @IBOutlet weak var numCorrectOutlet: UILabel!
    @IBOutlet weak var nameMostCorrectOutlet: UILabel!
    
    @IBOutlet weak var mostCorrectRound: UILabel!
    @IBOutlet weak var mostCorrectRoundName: UILabel!
    
    @IBOutlet weak var leastCorrectOverall: UILabel!
    @IBOutlet weak var leastCorrectOverallName: UILabel!

    @IBOutlet weak var leastCorrectRound: UILabel!
    @IBOutlet weak var leastCorrectRoundName: UILabel!
    
    
    @IBOutlet weak var playAgainOutlet: UIButton!
    @IBAction func playAgain(_ sender: Any)
    {
        //reset all global variables and go to start screen
        numCorrectTeam1 = 0
        numCorrectTeam2 = 0
        currentRound1 = 0
        currentRound2 = 0
        bestRound1 = 0
        bestRound2 = 0
        bestRoundName1 = ""
        bestRoundName2 = ""
        highestScore = 0
        highestScoreName = ""
        highestScore2 = 0
        highestScoreName2 = ""
        roundNumber = 0
        scoreArrayTeam1 = [0,0,0]
        scoreArrayTeam2 = [0,0,0]
        
        performSegue(withIdentifier: "segue4", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        numCorrectOutlet.text = String(highestScore)
        nameMostCorrectOutlet.text = highestScoreName
        
        mostCorrectRound.text = String(bestRound1)
        mostCorrectRoundName.text = bestRoundName1
        
        loveAppOutlet.text = String(totalPlayers)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
