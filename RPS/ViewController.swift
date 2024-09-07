//
//  ViewController.swift
//  RPS
//
//  Created by Argawan Noori on 8/23/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var appSignLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
   
  
    @IBAction func rockButtonTapped(_ sender: Any) {
        play(.rock)
    }
    
    @IBAction func paperButtonTapped(_ sender: Any) {
        play(.paper)
    }
    
    @IBAction func scissorsButtonTapped(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        updateUI(for: .start)
    }
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            updateUI(for: .start)
        }
        
        func updateUI(for state: GameState) {
            statusLabel.text = state.statusMessage
            
            switch state {
            case .start:
                view.backgroundColor = .gray
                appSignLabel.text = "🤖"
                playAgainButton.isHidden = true
                rockButton.isEnabled = true
                paperButton.isEnabled = true
                scissorsButton.isEnabled = true
                rockButton.isHidden = false
                paperButton.isHidden = false
                scissorsButton.isHidden = false
            case .win:
                view.backgroundColor = .green
            case .lose:
                view.backgroundColor = .red
            case .draw:
                view.backgroundColor = .yellow
            }
        }
        
        func play(_ sign: Sign) {
            let computerSign = randomSign()
            let gameState = sign.compare(against: computerSign)
            
            updateUI(for: gameState)
            appSignLabel.text = computerSign.emoji
            
            rockButton.isEnabled = false
            paperButton.isEnabled = false
            scissorsButton.isEnabled = false
            
            switch sign {
            case .rock:
                paperButton.isHidden = true
                scissorsButton.isHidden = true
            case .paper:
                rockButton.isHidden = true
                scissorsButton.isHidden = true
            case .scissors:
                rockButton.isHidden = true
                paperButton.isHidden = true
            }
            
            playAgainButton.isHidden = false
        }
    }

