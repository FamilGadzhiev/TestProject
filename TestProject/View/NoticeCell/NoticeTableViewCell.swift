//
//  NoticeTableViewCell.swift
//  TestProject
//
//  Created by Фамил Гаджиев on 12.08.17.
//  Copyright © 2017 Park. All rights reserved.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {

    @IBOutlet weak var flightDate: UILabel!
    @IBOutlet weak var gate: UILabel!
    
    var notice: Notice! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        let df = DateFormatter()
        df.dateStyle = .short
        
        flightDate.text = df.string(from: notice.flightDate!)
        gate.text = notice.gate
    }

}
