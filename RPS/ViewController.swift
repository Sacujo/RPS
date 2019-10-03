//
//  ViewController.swift
//  RPS
//
//  Created by Igor Guryan on 27/09/2019.
//  Copyright © 2019 Igor Guryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentGameState = GameState.start
    
    
    @IBOutlet var fullView: UIView!
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scisorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    
    
    
    func resetGame() {
        currentGameState = GameState.start
        gameStatusLabel.text = currentGameState.text
        self.view.backgroundColor = UIColor.lightGray
        appSign.text = "🤖"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        scisorsButton.isHidden = false
        scisorsButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        playButton.isHidden = true
    }
    
    func play(_ playerSign: Sign) {
        //        rockButton.isEnabled = false
        //        scisorsButton.isEnabled = false
        //        paperButton.isEnabled = false
        let opponentSign = randomSign()
        appSign.text = opponentSign.emoji
        switch playerSign {
        case .rock:
            rockButton.isHidden = false
            scisorsButton.isHidden = true
            paperButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            scisorsButton.isHidden = true
            paperButton.isHidden = false
        case .scisors:
            rockButton.isHidden = true
            scisorsButton.isHidden = false
            paperButton.isHidden = true
        }
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scisorsButton.isEnabled = false
        playButton.isHidden = false
        playButton.isEnabled = true
        currentGameState = playerSign.takeTurn(opponentSign)
        gameStatusLabel.text = currentGameState.text
        switch currentGameState {
        case .start:
            self.view.backgroundColor = UIColor.lightGray
        case .win:
            self.view.backgroundColor = UIColor.green
        case .lose:
            self.view.backgroundColor = UIColor.red
        case .draw:
            self.view.backgroundColor = UIColor.gray
        }
    }
    
    @IBAction func rockButtonTapped(_ sender: Any) {
        play(.rock)
    }
    @IBAction func scisorsButtonTapped(_ sender: Any) {
        play(.scisors)
    }
    @IBAction func paperButtonTapped(_ sender: Any) {
        play(.paper)
    }
    @IBAction func playAgainTapped(_ sender: Any) {
        resetGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        // Do any additional setup after loading the view.
    }
}

