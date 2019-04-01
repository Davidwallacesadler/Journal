//
//  EntryTableViewController.swift
//  Journal
//
//  Created by David Sadler on 3/31/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - TableView dataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "EntryTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EntryTableViewCell else {
            fatalError("ERROR: The selected cell is not an instance of EntryTableViewCell")
        }
        //Without Custom TableviewCell:
        // let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        // cell.textLabel?.text = entry.title
        let entry = EntryController.shared.entries[indexPath.row]
        cell.entryLabel.text = entry.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = EntryController.shared.entries[indexPath.row]
            EntryController.shared.remove(entry: entry)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
     // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowEntry" {
        guard let detailViewController = segue.destination as? EntryDetailViewController,
            let index = tableView.indexPathForSelectedRow?.row else {
                return
            }
            detailViewController.optionalEntry = EntryController.shared.entries[index]
        }
    }
}
