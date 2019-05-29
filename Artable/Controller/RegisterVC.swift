//
//  RegisterVC.swift
//  Artable
//
//  Created by Eric Barnes on 5/26/19.
//  Copyright © 2019 Eric Barnes. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var passwordCheckImg: UIImageView!
    @IBOutlet weak var confirmPasswordCheckImg: UIImageView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!


    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTxt.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        confirmPasswordTxt.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }

    @objc func textDidChange(_: UITextField) {
        // display checkmark image once we start typing in confirm
        guard let confPassTxt = confirmPasswordTxt.text, let passTxt = passwordTxt.text else {return}

            if passTxt.isEmpty {
                DispatchQueue.main.async {
                    self.passwordCheckImg.isHidden = true
                    self.confirmPasswordCheckImg.isHidden = true
                }
                passwordTxt.text = ""
                confirmPasswordTxt.text = ""
            } else {
                if confPassTxt.isNotEmpty {
                    if passwordTxt.text == confirmPasswordTxt.text {
                        passwordCheckImg.isHidden = false
                        confirmPasswordCheckImg.isHidden = false
                        passwordCheckImg.image = UIImage(named: AppImages.GreenCheck)
                        confirmPasswordCheckImg.image = UIImage(named: AppImages.GreenCheck)
                    } else {
                        passwordCheckImg.isHidden = false
                        confirmPasswordCheckImg.isHidden = false
                        passwordCheckImg.image = UIImage(named: AppImages.RedCheck)
                        confirmPasswordCheckImg.image = UIImage(named: AppImages.RedCheck)
                    }
                }
            }
    }

    @IBAction func registerPressed(_ sender: Any) {
        activitySpinner.startAnimating()
        guard let email = emailTxt.text, email.isNotEmpty,
              let password = passwordTxt.text, password.isNotEmpty,
              let username = usernameTxt.text, username.isNotEmpty
        else { return }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print("error: \(error.debugDescription)")
            } else {
                print("\nuser created: \(authResult?.user.email ?? "")\n")
            }
        }
        activitySpinner.stopAnimating()
    }
    

}
