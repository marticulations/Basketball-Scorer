//
//  ViewController.swift
//  Basketball scorer
//
//  Created by Sohil on 7/23/19.
//  Copyright © 2019 Sohil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, CanRecieve {

    @IBOutlet weak var teamOneName: UITextField!
    @IBOutlet weak var teamTwoName: UITextField!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var homeFoul: UILabel!
    @IBOutlet weak var awayFoul: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    
    var leftScore : Int = 0
    var rightScore : Int = 0
    var homeFoulOne : Int = 0
    var awayFoulOne : Int = 0
    var pointsToPlayTo : Int = 0
    lazy var leftWinTitle : String = "\(teamOneName.text!) Won!"
    lazy var leftWinMessage : String = "\(teamOneName.text!) beat \(teamTwoName.text!) and the score was \(homeScore.text!)-\(awayScore.text!)"
    lazy var rightWinTitle : String = "\(teamTwoName.text!) Won!"
    lazy var rightWinMessage : String = "\(teamTwoName.text!) beat \(teamOneName.text!) and the score was \(awayScore.text!)-\(homeScore.text!)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.teamOneName.delegate = self
        self.teamTwoName.delegate = self
    }

    
    @IBAction func homeOnePoint(_ sender: UIButton) {
        leftScore += 1
        if leftScore < 10 {
            homeScore.text = "0" + String(leftScore)
        } else if  leftScore > 10 {
            homeScore.text = String(leftScore)
            if leftScore >= pointsToPlayTo {
                leftTeamWon()
            }
        }
    }
    
    @IBAction func homeTwoPoint(_ sender: UIButton) {
        leftScore += 2
        
        if leftScore < 10 {
            homeScore.text = "0" + String(leftScore)
        } else if leftScore > 10 {
            homeScore.text = String(leftScore)
            if leftScore >= pointsToPlayTo{
                leftTeamWon()
            }
        }
    }
    
    
    @IBAction func homeThreePoint(_ sender: UIButton) {
        leftScore += 3
        if leftScore < 10 {
            homeScore.text = "0" + String(leftScore)
        } else if leftScore > 10 {
            homeScore.text = String(leftScore)
            if leftScore >= pointsToPlayTo{
                leftTeamWon()
            }
        }
    }
    
    
    @IBAction func foulPressed(_ sender: UIButton) {
        homeFoulOne += 1
        homeFoul.text = String(homeFoulOne)
    }
    
    @IBAction func awayOnePointer(_ sender: UIButton) {
        rightScore += 1
        if rightScore < 10 {
            awayScore.text = "0" + String(rightScore)
        } else if rightScore > 10 {
            awayScore.text = String(rightScore)
            if rightScore >= pointsToPlayTo{
                rightTeamWon()
            }
        }
    }
    
    
    @IBAction func awayTwoPoint(_ sender: Any) {
        rightScore += 2
        if rightScore < 10 {
            awayScore.text = "0" + String(rightScore)
        } else if rightScore > 10 {
            awayScore.text = String(rightScore)
            if rightScore >= pointsToPlayTo{
                rightTeamWon()
            }
        }
    }
    
    @IBAction func awayThreePoint(_ sender: UIButton) {
        rightScore += 3
        if rightScore < 10 {
            awayScore.text = "0" + String(rightScore)
        } else if rightScore > 10 {
            awayScore.text = String(rightScore)
            if rightScore >= pointsToPlayTo{
                rightTeamWon()
            }
        }
    }
    
    
    @IBAction func awayFoul(_ sender: UIButton) {
        awayFoulOne += 1
        awayFoul.text = String(awayFoulOne)
    }
    
    @IBAction func clear(_ sender: UIButton) {
        homeScore.text = "\(00)"
        awayScore.text = "\(00)"
        awayFoul.text = "\(0)"
        homeFoul.text = "\(0)"
        rightScore = 0
        leftScore = 0
        awayFoulOne = 0
        homeFoulOne = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        if teamOneName.text == "" && teamTwoName.text == "" {
            print("Random")
        } else if teamTwoName.text == "" {
            teamOneName.isEnabled = false
        } else if teamOneName.text == "" {
            teamTwoName.isEnabled = false
        }
        
        if teamTwoName.text != "" && teamOneName.text != "" {
            teamOneName.isEnabled = false
            teamTwoName.isEnabled = false
        }
    }
    
    func dataReceived(data: Int) {
        pointsToPlayTo = data
        
    }
    
    
    
    func leftTeamWon() {
        let alert = UIAlertController(title: leftWinTitle, message: leftWinMessage, preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "goToSettings") as! SecondViewController
            self.navigationController?.pushViewController(secondViewController, animated: true)
            self.homeScore.text = "\(00)"
            self.awayScore.text = "\(00)"
            self.awayFoul.text = "\(0)"
            self.homeFoul.text = "\(0)"
            self.rightScore = 0
            self.leftScore = 0
            self.awayFoulOne = 0
            self.homeFoulOne = 0
            self.teamOneName.isEnabled = true
            self.teamTwoName.isEnabled = true
            self.teamOneName.text = ""
            self.teamTwoName.text = ""
        }
        
        alert.addAction(restartAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func rightTeamWon() {
        
        let alert = UIAlertController(title: rightWinTitle, message: rightWinMessage, preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "goToSettings") as! SecondViewController
            self.navigationController?.pushViewController(secondViewController, animated: true)
            self.homeScore.text = "\(00)"
            self.awayScore.text = "\(00)"
            self.awayFoul.text = "\(0)"
            self.homeFoul.text = "\(0)"
            self.rightScore = 0
            self.leftScore = 0
            self.awayFoulOne = 0
            self.homeFoulOne = 0
            self.teamOneName.isEnabled = true
            self.teamTwoName.isEnabled = true
            self.teamOneName.text = ""
            self.teamTwoName.text = ""
        }
        
        alert.addAction(restartAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}

