//
//  DetailViewController.swift
//  MySimpleStoryboard
//
//  Created by 이현재 on 2023/08/10.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var friendNameLabel: UILabel!
    var friendName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        friendNameLabel.text = friendName
    }
    
    func setFriendName(with name: String) {
        friendName = name
        if name == "Black" {
            view.backgroundColor = .yellow
        } else {
            view.backgroundColor = .blue
        }
     
    }
}
