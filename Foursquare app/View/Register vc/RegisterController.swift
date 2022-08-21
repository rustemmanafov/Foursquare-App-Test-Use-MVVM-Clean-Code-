//
//  RegisterController.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit
import Alamofire

class RegisterController: UIViewController {

    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var genderTxt: UITextField!
    @IBOutlet weak var birthdatTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!

    var registeredUser = [Register]()
    var pickerView = UIPickerView()
    var dataPicker = UIDatePicker()
    var genderArr = ["Male", "Female"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        genderTxt.inputView = pickerView
        emailTxt.keyboardType = .emailAddress
        createDatePicker()
        genderTxt.text = "Male"
        
    }
    
    func signUp() {
        let url = "https://api.deezer.com/user/me"
        
        let signUp = Register(firstName: firstNameTxt.text, lastName: lastNameTxt.text, email: emailTxt.text, password: passwordTxt.text, gender: genderTxt.text, birthday: birthdatTxt.text)
        
        
        AF.request(url,method: .post,parameters: signUp).response { response in
            debugPrint(response)
            
            if response.response?.statusCode == 201 {
                self.navigationController?.popViewController(animated: true)
            } else {
                let alert = UIAlertController(title: "Alert", message: "Something went wrong", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
                }))
                self.present(alert, animated: true)
            }
            
        }
        
    }
    
    func createDatePicker() {
        birthdatTxt.textAlignment = .left
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        birthdatTxt.inputAccessoryView = toolBar
        birthdatTxt.inputView = dataPicker
        dataPicker.datePickerMode = .date

    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        birthdatTxt.text = formatter.string(from: dataPicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func signUpAct(_ sender: Any) {
        signUp()
    }

}
// gender picker view
extension RegisterController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderArr.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
            genderTxt.text = genderArr[row]
            genderTxt.resignFirstResponder()

    }
}

    
    
