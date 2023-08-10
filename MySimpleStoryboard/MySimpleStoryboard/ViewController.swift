//
//  ViewController.swift
//  MySimpleStoryboard
//
//  Created by 이현재 on 2023/08/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var friendNameTextField: UITextField!
    
    private var myFriends: [String] = ["Black", "Bami", "Cali", "Olivia", "Cong", "Lee"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let cell = sender as! UITableViewCell
            let indexPath = myTableView.indexPath(for: cell)
            let row = indexPath?.row ?? 0
            
            let detailView = segue.destination as! DetailViewController
            detailView.setFriendName(with: myFriends[row])
            
//            if myFriends[row] == "Black" {
//                detailView.view.backgroundColor = .green
//            } else {
//                detailView.view.backgroundColor = .red
//            }
        }
    }
    
    @IBAction func didTapAddFriend(_ sender: Any) {
        myFriends.append(friendNameTextField.text ?? "")
        friendNameTextField.text = ""
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell") {
            var content = cell.defaultContentConfiguration()
            
            content.text = myFriends[indexPath.row]
            
            cell.contentConfiguration = content
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        print(indexPath.section, indexPath.row)
    }
}

