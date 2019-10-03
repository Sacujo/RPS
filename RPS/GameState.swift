//
//  GameState.swift
//  RPS
//
//  Created by Igor Guryan on 27/09/2019.
//  Copyright © 2019 Igor Guryan. All rights reserved.
//

import Foundation


enum GameState {
    case start, win, lose, draw
    
    var text: String {
        switch self {
        case .start:
            return "Rock, paper, scisors?"
        case .win:
            return "You win!"
        case .lose:
            return "Sorry, you lose!"
        case .draw:
            return "It's a draw"
        }
    }
}
