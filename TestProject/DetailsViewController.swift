//
//  DetailsViewController.swift
//  TestProject
//
//  Created by Фамил Гаджиев on 13.08.17.
//  Copyright © 2017 Park. All rights reserved.
//

import UIKit

class DetailsViewController: UITableViewController {
    
    struct StoryboardConstants {
        static let detailCellIndentifier = "Detail Cell"
    }
    
    struct DetailsItem {
        let name: String
        let value: String
    }
    
    var items: [DetailsItem]!

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.detailCellIndentifier, for: indexPath)
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.value

        return cell
    }
    
}

