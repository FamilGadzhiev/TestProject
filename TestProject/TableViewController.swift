//
//  TableViewController.swift
//  TestProject
//
//  Created by Фамил Гаджиев on 12.08.17.
//  Copyright © 2017 Park. All rights reserved.
//

import UIKit
import SpriteKit

class TableViewController: UITableViewController {

    var items = [TableItem]()
    
    typealias DetailsItem = DetailsViewController.DetailsItem
    
    fileprivate var selectedItemDetails: [DetailsItem]?
    
    
    struct StoryboardConstants {
        static let eventCellIdentifier = "Event Cell"
        static let noticeCellIdentifier = "Notice Cell"
        static let moveCellIdentifier = "Move Cell Identifier"
        static let showDetailsSegueIdentifier = "Show Detail"
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "EventViewCell", bundle: nil), forCellReuseIdentifier: StoryboardConstants.eventCellIdentifier)
        tableView.register(UINib(nibName: "NoticeViewCell", bundle: nil), forCellReuseIdentifier: StoryboardConstants.noticeCellIdentifier)
        tableView.register(UINib(nibName: "MoveViewCell", bundle: nil), forCellReuseIdentifier: StoryboardConstants.moveCellIdentifier)
        
        generateData()
        tableView.reloadData()
        
    }
    
    func generateData() {
        
        let length = 10 + Int(arc4random_uniform(91))
        
        for _ in 0..<length {
            
            let type = arc4random_uniform(3)
            
            switch type {
            case 0:
                let event = Event()
                event.startTime = Date(timeIntervalSinceNow: 10.0)
                event.endTime = Date(timeIntervalSinceNow: 50.0)
                event.name = "Event"
                items.append(event)
            case 1:
                let notice = Notice(flightDate: Date(), gate: "A")
                items.append(notice)
            case 2:
                let move = Move()
                move.fromPlace = "LA"
                move.toPlace = "MSK"
                move.estimateTime = 43800.0
                items.append(move)
            default:
                break
            }
            
        }
        
        
    }


    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        
        if let event = item as? Event {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.eventCellIdentifier) as! EventTableViewCell
            itemCell.event = event
            return itemCell

        } else if let notice = item as? Notice {
            let noticeCell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.noticeCellIdentifier) as! NoticeTableViewCell
            
            noticeCell.notice = notice
            return noticeCell

        } else if let move = item as? Move {
            let moveCell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.moveCellIdentifier) as! MoveTableViewCell
            moveCell.move = move
            return moveCell
        }
        
        
        return tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedItemDetails?.removeAll()
        
        let item = items[indexPath.row]
        
        let df = DateFormatter()
        df.dateStyle = .medium
        
        if let event = item as? Event {
            
            selectedItemDetails = [
                DetailsItem(name: "Name" , value: event.name ),
                DetailsItem(name: "Start time" , value: df.string(from: event.startTime!)),
                DetailsItem(name: "End time", value: df.string(from: event.endTime!))
            ]
            
        } else if let notice = item as? Notice {
            selectedItemDetails = [
                DetailsItem(name: "Gate", value: notice.gate!),
                DetailsItem(name: "Flight date", value: df.string(from: notice.flightDate!))
            ]
        
        } else if let move = item as? Move {
            selectedItemDetails = [
                DetailsItem(name: "From", value: move.fromPlace! ),
                DetailsItem(name: "To", value: move.toPlace! ),
                DetailsItem(name: "Estimated time", value: move.estimatedTimeFormattedString!)
            ]
        }
        
        performSegue(withIdentifier: StoryboardConstants.showDetailsSegueIdentifier, sender: nil)
        
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == StoryboardConstants.showDetailsSegueIdentifier, let detailsVC = segue.destination as? DetailsViewController {

            detailsVC.items = selectedItemDetails
            
        }
        
    }
    

}
