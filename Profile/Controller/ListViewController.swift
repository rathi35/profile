//
//  ListViewController.swift
//  Profile
//
//  Created by Rathi on 04/04/21.
//

import UIKit

enum DataType {
    case male
    case female
    case favourite
}

final class ListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var type: DataType = .male
    var results: [Profile]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(ListTableViewCell.self)
        if type == .favourite {
            navigationItem.title = "Favourite List"
            view.backgroundColor = UIColor(named: "white")
        } else {
            tableView.contentInset.top = 90
        }
        filterData()
        showOrHideErrorMessage()
    }
    
    func updateType(_ type: DataType) {
        self.type = type
        filterData()
        showOrHideErrorMessage()
        tableView.reloadData()
    }
    
    func showOrHideErrorMessage() {
        if results?.isEmpty == false {
            tableView.removeBackgroundMessage()
        } else {
            tableView.addNoContentBackgroundView("List is Empty!")
        }
    }
    
    func filterData() {
        
        if let items = DBManager.getProfileList() {
            switch type {
            case .male:
                results = Array(items.filter {$0.gender == "male"})
            case .female:
                results =  Array(items.filter {$0.gender == "female"})
            case .favourite:
                results =  Array(items.filter {$0.isFav})
            }
        }
    }
    
    override func modifyFavStatus(_ profileID: String, isFav: Bool) {
        DBManager.updateFavStatus(profileID, isFav: isFav)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = results?[indexPath.row]
        let cell = tableView.dequeueReusableCell(ListTableViewCell.self, indexPath: indexPath)
        cell.profileImageView.setImageWithAnimation(imagePath: item?.picture)
        cell.profile = item
        cell.setFavStatus()
        cell.nameLabel.text = item?.name
        cell.genderlabel.text = item?.gender
        cell.agelabel.text = "\(item?.age ?? 0) Yrs"
        return cell
    }
}
