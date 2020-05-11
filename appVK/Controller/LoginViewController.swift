//
//  LoginViewController.swift
//  appVK
//
//  Created by Sergey Desyak on 28.10.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGR)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        //navigationController?.navigationItem.backBarButtonItem?.title =  "Выход"
    }
    
    
    
    @IBOutlet var loginScroll: UIScrollView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        guard let login = nameTextField.text,
            let password = passTextField.text,
            login == "",
            password == "" else {
                //show(message: "Incorrect login/password")
                return
        }
        
        performSegue(withIdentifier: "Login Segue", sender: nil)
    }
    
    @objc func willShowKeyboard(_ notification: Notification){
        guard let info = notification.userInfo as NSDictionary? , let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else { return }
        let keyboardHeigth = keyboardSize.cgRectValue.size.height
        loginScroll.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeigth, right: 0)
        
    }
    
    @objc func willHideKeyboard(_ notification: Notification){
        loginScroll.contentInset = .zero
    }
    
    @objc func viewTapped(){
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
