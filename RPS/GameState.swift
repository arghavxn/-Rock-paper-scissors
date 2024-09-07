//
//  GameState.swift
//  RPS
//
//  Created by Argawan Noori on 8/23/24.
//

import Foundation
enum GameState {
    case start, win, lose, draw
    
    var statusMessage: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You won!"
        case .lose:
            return "You lost!"
        case .draw:
            return "It's a draw!"
        }
    }
}
