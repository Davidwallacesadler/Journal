//
//  EntryTableViewController.swift
//  Journal
//
//  Created by David Sadler on 3/31/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {
    
    // WANT TO PASS IN AN ENTRY COLLECTION INTO THIS VIEW CONTROLLER
    // MARK: - Internal Properties:
    
    var journal: Journal?
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - TableView dataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return EntryController.shared.entries.count
        guard let entryCollectionCount = journal?.entryCollection.count else { return 0 }
        return entryCollectionCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "EntryTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EntryTableViewCell else {
            print("ERROR: The selected cell is not an instance of EntryTableViewCell")
            return UITableViewCell()
        }
        
        if let argJournal = journal {
            let entry = argJournal.entryCollection[indexPath.row]
            let timeOfEntry = DateFormatHelper.format(date: entry.timeStamp)
            cell.entryLabel.text = entry.title
            cell.dateLabel.text = timeOfEntry
            return cell
        }
       //let entry = EntryController.shared.entries[indexPath.row]
       //let timeOfEntry = DateFormatHelper.format(date: entry.timeStamp)
        
        //cell.entryLabel.text = entry.title
        //cell.dateLabel.text = timeOfEntry
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let argJournal = journal {
                let entry = argJournal.entryCollection[indexPath.row]
                JournalController.shared.removeEntry(journal: argJournal, journalEntry: entry)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            }
            //let entry = EntryController.shared.entries[indexPath.row]
            //EntryController.shared.remove(entry: entry)
            //tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
     // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowEntry" {
        guard let detailViewController = segue.destination as? EntryDetailViewController,
            let index = tableView.indexPathForSelectedRow?.row,
            let argJournal = journal else { return }
            detailViewController.entry = argJournal.entryCollection[index]
            //detailViewController.entry = EntryController.shared.entries[index]
        }
    }
}
