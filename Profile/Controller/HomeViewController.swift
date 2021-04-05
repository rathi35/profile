//
//  HomeViewController.swift
//  Profile
//
//  Created by Rathi on 05/04/21.
//

import UIKit

final class HomeViewController: BaseViewController {
    var childVc: ListViewController?
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        needFavButton = true
        super.viewDidLoad()
        if (DBManager.getProfileList()?.count ?? 0) > 0 {
            return
        }
        _ = APIService().getProfileInfo { [weak self] (profileList, error) in
            guard let self = self else { return }
            if let profileList = profileList {
                DBManager.saveData(profileList)
            }
            self.childVc?.updateType(self.segmentControl.selectedSegmentIndex == 0 ? .male : .female)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listView" {
            childVc = segue.destination as? ListViewController
        }
    }
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        childVc?.updateType(sender.selectedSegmentIndex == 0 ? .male : .female)
    }
}
