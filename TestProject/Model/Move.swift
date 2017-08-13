//
//  Move.swift
//  TestProject
//
//  Created by Фамил Гаджиев on 12.08.17.
//  Copyright © 2017 Park. All rights reserved.
//

import Foundation

class Move {
    
    var fromPlace: String?
    var toPlace: String?
    var estimateTime: TimeInterval?
    
}


extension Move {
    
    var estimatedTimeFormattedString: String? {
        
        guard let time = estimateTime else {
            return nil
        }
        
        let h = Int(time) / 3600
        let m = (Int(time) / 60) % 60
        let s = Int(time) % 60
        
        return String(format: "%u:%02u:%02u", h, m, s)
        
    }
    
}
