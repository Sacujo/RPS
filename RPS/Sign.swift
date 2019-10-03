//
//  Sign.swift
//  RPS
//
//  Created by Igor Guryan on 27/09/2019.
//  Copyright © 2019 Igor Guryan. All rights reserved.
//

import Foundation

import GameplayKit

let randomChoise = GKRandomDistribution(lowestValue: 0, highestValue: 2)
func randomSign() -> Sign {
    let sign = randomChoise.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scisors
    }
}

enum Sign {
    case rock, scisors, paper
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scisors:
            return "✌️"
        }
    }
    
    func takeTurn(_ opponentSign: Sign) -> GameState {
        switch self {
        case .paper:
            switch opponentSign {
            case .paper:
                return GameState.draw
            case .rock:
                return GameState.win
            case .scisors:
                return GameState.lose
            }
        case .scisors:
            switch opponentSign {
            case .paper:
                return GameState.win
            case .rock:
                return GameState.lose
            case .scisors:
                return GameState.draw
            }
        case .rock:
            switch opponentSign {
            case .paper:
                return GameState.lose
            case .rock:
                return GameState.draw
            case .scisors:
                return GameState.win
            }
        }
    }
}
