//
//  JournalTableViewController.swift
//  Journal
//
//  Created by David Sadler on 4/2/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import UIKit

class JournalTableViewController: UITableViewController {
 
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JournalController.shared.journals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalTableViewCell", for: indexPath)
        let journal = JournalController.shared.journals[indexPath.row]
        cell.textLabel?.text = journal.name
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let journal = JournalController.shared.journals[indexPath.row]
            JournalController.shared.remove(journal: journal)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowJournalEntries" {
            guard let detailViewController = segue.destination as? EntryTableViewController,
                let index = tableView.indexPathForSelectedRow?.row else { return }
                detailViewController.journal = JournalController.shared.journals[index]
        }
    }
}
