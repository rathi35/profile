//
//  SignUpViewModel.swift
//  Profile
//
//  Created by Rathi on 05/04/21.
//

import Foundation

class SignUpViewModel {
    var name: String?
    var dob: String?
    var selectedImageData: Data?
    var gender: String = "male"
    
    func validateFields() -> Bool {
        guard let name = name, !name.isEmpty else {
            ToastView.toast(with: "Name is Empty")?.show()
            return false
        }
        guard let dob = dob, !dob.isEmpty else {
            ToastView.toast(with: "DOB is Empty")?.show()
            return false
        }
        return true
    }
    
    func saveData() {
        if let name = name, let dob = dob {
            let user = User(name: name, gender: gender, dob: dob, image: selectedImageData)
            DBManager.saveData(user)
        }
    }
}
