//
//  LoginController.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit
import Alamofire

class LoginController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    var users = [Login]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func checkUserIsExist(){
        
        let urlFile = "https://api.deezer.com/user/me"
     
        AF.request(urlFile, method: .get).response { response in
            debugPrint(response)
                if response.response?.statusCode == 200 {
                    let controller = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                    self.show(controller, sender: nil)
                } else {
                    let alert = UIAlertController(title: "Alert", message: "Something went wrong", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
                    }))
                    self.present(alert, animated: true)
                }
        }
        
     }
    
    @IBAction func signInAct(_ sender: Any) {
        
        if emailTxt.text?.isEmpty == true || passwordTxt.text?.isEmpty == true {
            let alert = UIAlertController(title: "Alert", message: "Something went wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            }))
            self.present(alert, animated: true)
            
            checkUserIsExist()

        }
        
    }
    
    @IBAction func registerAct(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        show(controller, sender: nil)
    }
    
}

