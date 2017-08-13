//
//  MoveTableViewCell.swift
//  TestProject
//
//  Created by Фамил Гаджиев on 12.08.17.
//  Copyright © 2017 Park. All rights reserved.
//

import UIKit

class MoveTableViewCell: UITableViewCell {

    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var estimateTime: UILabel!

    var move: Move! {
        didSet{
            updateUI()
        }
    }
    
    func updateUI() {
        
        estimateTime.text = move.estimatedTimeFormattedString
        to.text = move.toPlace
        from.text = move.fromPlace
    }
    

}
