//
//  ViewController.swift
//  vk_client_test
//
//  Created by admin on 03.08.2022.
//
import Foundation
import UIKit

class LoginViewController: UIViewController {

    //MARK: - References
    @IBOutlet var txtLogin: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet weak var btLogin: UIButton!
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func btLogin_TouchUpInside(_ sender: UIButton, forEvent event: UIEvent) {
        if self.txtLogin.text != "" || self.txtPassword.text != "" {
            self.showError("Wrong pair <login, password>")
            return
        }
        
        //let s = MemoryLayout<UIButton>.size
        //print("sizeof = \(s)")
        
        self.performSegue(withIdentifier: "segueLogin", sender: self)
    }
    
    func showError(_ msg: String) {
        let vue_alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        let act = UIAlertAction(title: "OK", style: .default)
        vue_alert.addAction(act)
        
        self.present(vue_alert, animated: false)
    }
}



