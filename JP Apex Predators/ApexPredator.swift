//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by David Laczkovits on 08.10.23.
//

import Foundation
import SwiftUI

struct ApexPredator : Codable, Identifiable {
    let id : Int
    let name : String
    let type : String
    let movies : [String]
    let movieScenes : [MovieScene]
    let link : String
    
    func typeOverlay() -> Color {
        switch type {
        case "land":
            return Color.brown
        case "air":
            return Color.teal
        case "sea":
            return Color.blue
        default:
            return Color.brown
        }
    }
}

struct MovieScene : Codable, Identifiable {
    let id : Int
    let movie : String
    let sceneDescription : String
}
