//
//  SecondViewController.swift
//  pictionaryTimer
//
//  Created by Douglas O'Meara on 5/18/17.
//  Copyright © 2017 Douglas O'Meara. All rights reserved.
//

import UIKit

var scoreArrayTeam1 = [Int]()
var scoreArrayTeam2 = [Int]()

class SecondViewController: UIViewController {

    
    @IBOutlet weak var team1Score: UILabel!
    
    @IBOutlet weak var team2Score: UILabel!
    
    @IBOutlet weak var nextTeam: UILabel!
    
    
    @IBOutlet weak var readyOutlet: UIButton!
    @IBAction func ready(_ sender: Any)
    {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        team1Score.text = "Score: " + String(numCorrectTeam1)
        team2Score.text = "Score: " + String(numCorrectTeam2)
        
        print(roundNumber)
        
        if(roundNumber % 2 == 0) //team 1
        {
            if(numPlayersTeam1 >= team1Array.count)
            {
                numPlayersTeam1 = 0 //reset back to 0
            }
            nextTeam.text = "Up Next: " + team1Array[numPlayersTeam1]
            //numPlayersTeam1 += 1
        }
        else if(roundNumber % 2 == 1) //team 2
        {
            if(numPlayersTeam2 >= team2Array.count)
            {
                numPlayersTeam2 = 0 //reset back to 0
            }
            nextTeam.text = "Up Next: " + team2Array[numPlayersTeam2]
            
            //numPlayersTeam2 += 1
        }
        
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
