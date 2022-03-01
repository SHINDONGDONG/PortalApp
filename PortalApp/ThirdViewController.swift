//
//  ThirdViewController.swift
//  PortalApp
//
//  Created by 申民鐡 on 2021/12/25.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBAction func popToview(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let homeController = storyboard.instantiateViewController(withIdentifier: "HomeController")
        self.navigationController?.popToViewController(homeController, animated: true)
        
    }
    @IBAction func rootButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    override func viewDidLoad() {   
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
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
