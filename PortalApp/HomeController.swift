//
//  HomeController.swift
//  PortalApp
//
//  Created by 申民鐡 on 2021/12/25.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var IdTextField: UITextField!
    @IBOutlet weak var PassTextField: UITextField!
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
}
