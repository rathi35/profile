//
//  AccountViewController.swift
//  Profile
//
//  Created by Rathi on 04/04/21.
//

import UIKit

final class AccountViewController: BaseViewController {
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var dobLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    var viewModel: AccountViewModel!
    
    override func viewDidLoad() {
        needFavButton = true
        super.viewDidLoad()
        viewModel = AccountViewModel()
        userImage.cornerRadius = UIDevice.isiPad() ? 80 : 65
        configureUI()
    }
    
    private func configureUI() {
        let user = viewModel.getUser()
        nameLabel.text = user?.name
        dobLabel.text = user?.dob
        genderLabel.text = user?.gender
        if let data = user?.image {
            userImage.image = UIImage(data: data)
        }
    }
    
    @IBAction func logoutButonAction(_ button: UIButton) {
        viewModel.logoutAction()
        Router.showSignUpScreen()
    }
}
