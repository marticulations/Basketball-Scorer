//
//  SecondViewController.swift
//  Basketball scorer
//
//  Created by Sohil on 7/23/19.
//  Copyright © 2019 Sohil. All rights reserved.

//TODO
// Next button pressed with no inputs
// All buttons disabled on scorer if both team names not entered
// SEARCHUP: Set-up Listeners for focus lost and focus gained from text field
// When restart button clicked the program doesn't go to settings view controller


import UIKit

protocol CanRecieve {
    func dataReceived(data: Int)
}

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var numberPlayers: UITextField!
    @IBOutlet weak var numberOfPoints: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isEnabled = false
        self.numberPlayers.delegate = self
        self.numberOfPoints.delegate = self
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "SwitchToScorer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SwitchToScorer" {
            
            let vc = segue.destination as! ViewController
            let numberOFPoints : Int = Int(numberOfPoints.text!)!
            
            vc.dataReceived(data: numberOFPoints)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        if numberPlayers.text == "" && numberOfPoints.text == "" {
            print("Random")
        } else if numberPlayers.text == "" {
            numberOfPoints.isEnabled = false
        } else if numberOfPoints.text == "" {
            numberPlayers.isEnabled = false
        }
        if numberPlayers.text != "" && numberOfPoints.text != "" {
            numberPlayers.isEnabled = false
            numberOfPoints.isEnabled = false
        }
    }
    
    
    
    
}

