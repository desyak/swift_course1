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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { self.performSegue(withIdentifier: "Login Segue", sender: nil) }
        progress()
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
    func progress() {
        let point1 = ProgressBar(frame: CGRect.init(
            x: 0, y: 200,
            width: 50,
            height: 50))
        point1.center.x = self.view.frame.width / 2 - 70
        point1.alpha = 0
        
        let point2 = ProgressBar(frame: CGRect.init(
            x: 0, y: 200,
            width: 50,
            height: 50))
        point2.center.x = self.view.frame.width / 2
        point2.alpha = 0
        
        let point3 = ProgressBar(frame: CGRect.init(
            x: 0, y: 200,
            width: 50,
            height: 50))
        point3.center.x = self.view.frame.width / 2 + 70
        point3.alpha = 0
        
        self.view.addSubview(point1)
        self.view.addSubview(point2)
        self.view.addSubview(point3)
        
        UIView.animateKeyframes(withDuration: 1.2, delay: 0, options: [ .repeat ], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.33) {
                point1.alpha = 1
                self.view.alpha = 0.7
            }
            UIView.addKeyframe(withRelativeStartTime: 0.33, relativeDuration: 0.33) {
                point1.alpha = 0
                point2.alpha = 1
                self.view.alpha = 0.4
            }
            UIView.addKeyframe(withRelativeStartTime: 0.66, relativeDuration: 0.33) {
                point2.alpha = 0
                point3.alpha = 1
                self.view.alpha = 0.15
            }
        })
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
