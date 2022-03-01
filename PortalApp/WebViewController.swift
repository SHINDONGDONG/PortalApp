//
//  WebViewController.swift
//  PortalApp
//
//  Created by 申民鐡 on 2022/01/29.
//

import Foundation
import UIKit


class WebViewController: UIViewController {
    
    let firstView: UIView = {
        let firstView = UIView()
        firstView.backgroundColor = .blue
        return firstView
    }()
    
    let secondView: UIView = {
        let secondView = UIView()
        secondView.backgroundColor = .red
        return secondView
    }()
    
    let firstText: UILabel = {
        let firstText = UILabel()
        firstText.text = "ABCD"
        firstText.font = .systemFont(ofSize: 24, weight: .semibold)
        firstText.textColor = .white
        return firstText
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        firstView.addSubview(secondView)
        view.addSubview(firstView)
        firstView.addSubview(firstText)
//        self.title = "ABCD"

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        secondView.frame = CGRect(x: 0, y: 0, width: firstView.frame.size.width / 2 , height: firstView.frame.size.height / 2)
        firstText.frame = CGRect(x: 10, y: 10, width: firstText.frame.size.width, height: firstText.frame.size.height)
        firstText.sizeToFit()
    }
}
