//
//  ViewController.swift
//  TokenUsers
//
//  Created by Josh Wisenbaker on 7/8/19.
//  Copyright © 2019 Josh Wisenbaker. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerForNotifications()
        updateUsers()
        tableView.reloadData()
    }

    func registerForNotifications() {
        NotificationCenter.default.addObserver(forName: kNotificationName,
                                               object: nil,
                                               queue: OperationQueue.main,
                                               using: { _ in self.tableView.reloadData() })
    }
}

extension ViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return Users.sharedInstance.resolvedUsers.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cellView = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }

        if tableColumn?.title == "Record Name" {
            cellView.textField?.stringValue = Users.sharedInstance.resolvedUsers[row].recordName
        } else {
            cellView.textField?.stringValue = Users.sharedInstance.resolvedUsers[row].uuid
        }

        return cellView
    }
}
