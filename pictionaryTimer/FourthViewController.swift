//
//  FourthViewController.swift
//  pictionaryTimer
//
//  Created by Douglas O'Meara on 5/18/17.
//  Copyright © 2017 Douglas O'Meara. All rights reserved.
//

import UIKit

var numPlayersTeam1 = 0
var numPlayersTeam2 = 0
var player1 = ""
var player2 = ""
var player3 = ""
var player4 = ""
var player5 = ""
var player6 = ""

var totalPlayers = 0

var team1Array = [String]()
var team2Array = [String]()

var numHighestRound1 = [Int]()
var numHighestRound2 = [Int]()

class FourthViewController: UIViewController {

    @IBOutlet weak var team1NumPlayers: UITextField!
    @IBOutlet weak var team1Player1: UITextField!
    @IBOutlet weak var team1Player2: UITextField!
    @IBOutlet weak var team1Player3: UITextField!
    
    @IBOutlet weak var team2NumPlayers: UITextField!
    @IBOutlet weak var team2Player1: UITextField!
    @IBOutlet weak var team2Player2: UITextField!
    @IBOutlet weak var team2Player3: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        team1NumPlayers.resignFirstResponder()
        if(team1NumPlayers.text == "1")
        {
            team1Player1.isHidden = false
            team1Player2.isHidden = true
            team1Player3.isHidden = true
            startOutlet.isHidden = true
        }
        else if(team1NumPlayers.text == "2") //if 2 players, reveal player 2 text field
        {
            team1Player1.isHidden = false
            team1Player2.isHidden = false
            team1Player3.isHidden = true
            startOutlet.isHidden = false
        }
        else if(team1NumPlayers.text == "3") //if 3 players, reveal player 3 text field
        {
            team1Player1.isHidden = false
            team1Player2.isHidden = false
            team1Player3.isHidden = false
            startOutlet.isHidden = false
        }
        else{
            startOutlet.isHidden = true
        }

        team2NumPlayers.resignFirstResponder()
        if(team2NumPlayers.text == "1")
        {
            team2Player1.isHidden = false
            team2Player2.isHidden = true
            team2Player3.isHidden = true
            startOutlet.isHidden = false
        }
        else if(team2NumPlayers.text == "2") //if 2 players, reveal player 2 text field
        {
            team2Player1.isHidden = false
            team2Player2.isHidden = false
            team2Player3.isHidden = true
            startOutlet.isHidden = false
        }
        else if(team2NumPlayers.text == "3") //if 3 players, reveal player 3 text field
        {
            team2Player1.isHidden = false
            team2Player2.isHidden = false
            team2Player3.isHidden = false
            startOutlet.isHidden = false
        }
        else{
            startOutlet.isHidden = true
        }
        
    }
    
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func start(_ sender: Any)
    {
        numPlayersTeam1 = Int(team1NumPlayers.text!)!
        numPlayersTeam2 = Int(team2NumPlayers.text!)!
        totalPlayers = numPlayersTeam1 + numPlayersTeam2
        player1 = team1Player1.text!
        player2 = team1Player2.text!
        player3 = team1Player3.text!
        player4 = team2Player1.text!
        player5 = team2Player2.text!
        player6 = team2Player3.text!
        
        if(player1 == "Meriah")
        {
            player1 = "Messy Meriah"
        }
        if(player1 == "Sarah")
        {
            player1 = "Sloppy Sarah"
        }
        if(player1 == "Danny")
        {
            player1 = "Butt Face"
        }
        if(player1 == "Ryan")
        {
            player1 = "Sasquatch"
        }
        if(player2 == "Meriah")
        {
            player2 = "Messy Meriah"
        }
        if(player2 == "Sarah")
        {
            player2 = "Sloppy Sarah"
        }
        if(player2 == "Danny")
        {
            player2 = "Butt Face"
        }
        if(player2 == "Ryan")
        {
            player2 = "Sasquatch"
        }
        if(player3 == "Meriah")
        {
            player3 = "Messy Meriah"
        }
        if(player3 == "Sarah")
        {
            player3 = "Sloppy Sarah"
        }
        if(player3 == "Danny")
        {
            player3 = "Butt Face"
        }
        if(player3 == "Ryan")
        {
            player3 = "Sasquatch"
        }
        if(player4 == "Meriah")
        {
            player4 = "Messy Meriah"
        }
        if(player4 == "Sarah")
        {
            player4 = "Sloppy Sarah"
        }
        if(player4 == "Danny")
        {
            player4 = "Butt Face"
        }
        if(player4 == "Ryan")
        {
            player4 = "Sasquatch"
        }
        if(player5 == "Meriah")
        {
            player5 = "Messy Meriah"
        }
        if(player5 == "Sarah")
        {
            player5 = "Sloppy Sarah"
        }
        if(player5 == "Danny")
        {
            player5 = "Butt Face"
        }
        if(player5 == "Ryan")
        {
            player5 = "Sasquatch"
        }
        if(player6 == "Meriah")
        {
            player6 = "Messy Meriah"
        }
        if(player6 == "Sarah")
        {
            player6 = "Sloppy Sarah"
        }
        if(player6 == "Danny")
        {
            player6 = "Butt Face"
        }
        if(player6 == "Ryan")
        {
            player6 = "Sasquatch"
        }
        
        
        if(numPlayersTeam1 == 1 || numPlayersTeam2 == 1)
        {
            startOutlet.isHidden = true
        }
        
        if(numPlayersTeam1 == 2)
        {
            team1Array = [player1, player2]
            scoreArrayTeam1 = [0,0]
            numHighestRound1 = [0,0]
        }
        else if(numPlayersTeam1 == 3)
        {
            team1Array = [player1, player2, player3]
            scoreArrayTeam1 = [0,0,0]
            numHighestRound1 = [0,0,0]
        }
        
        if(numPlayersTeam2 == 2)
        {
            team2Array = [player4, player5]
            scoreArrayTeam2 = [0,0]
            numHighestRound2 = [0,0]

        }
        else if(numPlayersTeam2 == 3)
        {
            team2Array = [player4, player5, player6]
            scoreArrayTeam2 = [0,0,0]
            numHighestRound2 = [0,0,0]

        }
        
        performSegue(withIdentifier: "segue2", sender: self)
        print(team1Array)
        print(team2Array)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        team1Player1.isHidden = true
        team1Player2.isHidden = true
        team1Player3.isHidden = true
        
        team2Player1.isHidden = true
        team2Player2.isHidden = true
        team2Player3.isHidden = true
        
        startOutlet.isHidden = true
        
        team1NumPlayers.delegate = self
        team1Player1.delegate = self
        team1Player2.delegate = self
        team1Player3.delegate = self
        
        team2NumPlayers.delegate = self
        team2Player1.delegate = self
        team2Player2.delegate = self
        team2Player3.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FourthViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
