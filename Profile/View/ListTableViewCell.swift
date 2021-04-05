//
//  ListTableViewCell.swift
//  Profile
//
//  Created by Rathi on 05/04/21.
//

import UIKit

final class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderlabel: UILabel!
    @IBOutlet weak var agelabel: UILabel!
    var profile: Profile?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.setShadow(color: UIColor(named: "shadow")!, shadowRadius: 10, offsetHeight: 3)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.cancelLoading()
    }
    
    @IBAction func favButtontapped(_ sender: UIButton) {
        if let profile = profile {
            sender.setImage(!profile.isFav ? #imageLiteral(resourceName: "heart_filled") : #imageLiteral(resourceName: "heart"), for: .normal)
            next?.modifyFavStatus(profile._id ?? "", isFav: !profile.isFav)
        }
    }
    
    func setFavStatus() {
        if let profile = profile {
            favButton.setImage(profile.isFav ? #imageLiteral(resourceName: "heart_filled") : #imageLiteral(resourceName: "heart"), for: .normal)
        }
    }
    
    deinit {
        profileImageView.cancelLoading()
    }
}
