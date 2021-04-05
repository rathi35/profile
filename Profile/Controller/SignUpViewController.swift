//
//  SignUpViewController.swift
//  Profile
//
//  Created by Rathi on 04/04/21.
//

import UIKit
import SkyFloatingLabelTextField

final class SignUpViewController: BaseViewController {
    @IBOutlet private weak var nameTextField: SkyFloatingLabelTextField!
    @IBOutlet private weak var dobField: SkyFloatingLabelTextField!
    @IBOutlet private weak var maleFemaleSegmentControl: UISegmentedControl!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    @IBOutlet private weak var containerview: UIView!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var selectedImage: UIImageView!
    
    private var datePicker: UIDatePicker!
    
    var viewModel: SignUpViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SignUpViewModel()
        addToolBar()
        addDatePicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deregisterFromKeyboardNotifications()
    }
    
    @IBAction func imagePicker(_ sender: Any) {
        containerview.endEditing(false)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func signupButton(_ sender: UIButton) {
        containerview.endEditing(false)
        viewModel.name = nameTextField.text?.trimmingCharacters(in: .whitespaces)
        viewModel.dob = dobField.text?.trimmingCharacters(in: .whitespaces)
        viewModel.gender = maleFemaleSegmentControl.selectedSegmentIndex == 0 ? "male": "female"
        if viewModel.validateFields() {
            
            viewModel.saveData()
            //signup successfull
            Router.displayRootTab()
        }
    }
    @objc func donedatePicker(){
        dobField.text = datePicker.date.dateString(with: "dd/MM/yyyy")
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
    func addDatePicker() {
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = .date
        datepicker.maximumDate = Date().dateByAddingyears(-1)
        datepicker.minimumDate = Date().dateByAddingyears(-100)
        if #available(iOS 14, *) {// Added condition for iOS 14
            datepicker.preferredDatePickerStyle = .wheels
            datepicker.sizeToFit()
        }
        dobField.inputView = datepicker
        datePicker = datepicker
    }
    func addToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        dobField.inputAccessoryView = toolbar
    }
    
    func registerForKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func deregisterFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        
        let userInfo = notification.userInfo!
        var keyboardRect:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        if keyboardRect.size.height <= 0 {
            keyboardRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        }
        
        keyboardRect = view.convert(keyboardRect, from: nil)
        if let rect = signUpButton?.frame {
            let keyboardRectInset = keyboardRect.size.height - (UIScreen.main.bounds.height - scrollView.convert(rect, from: signUpButton.superview).maxY)
            
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardRectInset, right: 0.0)
            self.scrollView.contentInset = contentInsets
            var viewRect = self.signUpButton?.frame ?? .zero
            viewRect = self.scrollView.convert(self.signUpButton.frame, from: self.signUpButton.superview)
            self.scrollView.scrollRectToVisible(viewRect, animated: true)
        }
    }
    
    @objc func keyboardWillBeHidden(notification _: Notification) {
        scrollView.contentInset = .zero
    }
}
extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return false
    }
}
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            viewModel.selectedImageData = pickedImage.jpegData(compressionQuality: 0.4)
            selectedImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
}
