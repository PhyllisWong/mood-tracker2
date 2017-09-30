//
//  FriendsTableViewController.swift
//  MoodTracker2
//
//  Created by djchai on 9/29/17.
//  Copyright © 2017 djchai. All rights reserved.
//

import UIKit

struct Friend {
    let name: String
    var mood: Mood?
}

enum Mood: String {
    case happy = "😄"
    case neutral = "🤖"
    case sad = "😢"
    case angry = "😡"
}

class FriendsTableViewController: UITableViewController {
    
    var friends: [Friend] = [
        Friend(name: "Ross", mood: nil),
        Friend(name: "Rachel", mood: nil),
        Friend(name: "Monica", mood: nil),
        Friend(name: "Chandler", mood: nil),
        Friend(name: "Pheobe", mood: nil),
        Friend(name: "Joey", mood: nil)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath)

        // Configure the cell...
        let selectedFriend = friends[indexPath.row]
        goToMoodTableViewController(selectedFriend: selectedFriend)

        return cell
    }
    
    func goToMoodTableViewController(selectedFriend: Friend) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let moodTableViewController = storyboard.instantiateViewController(withIdentifier: "MoodTableViewController") as? MoodTableViewController
            else {return}
        
        moodTableViewController.selectedFriend = selectedFriend
        
        
        self.navigationController?.pushViewController(moodTableViewController, animated: true)
    }
    
    

}
