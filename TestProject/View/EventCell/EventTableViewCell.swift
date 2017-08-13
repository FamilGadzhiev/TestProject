//
//  EventTableViewCell.swift
//  TestProject
//
//  Created by Фамил Гаджиев on 12.08.17.
//  Copyright © 2017 Park. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var start: UILabel!
    @IBOutlet weak var end: UILabel!
    
    var event: Event!{
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        name.text = event.name
        let df = DateFormatter()
        df.dateStyle = .medium
        
        start.text = df.string(from: event.startTime!)
        end.text = df.string(from: event.endTime!)
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
