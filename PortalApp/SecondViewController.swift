//
//  SecondViewController.swift
//  PortalApp
//
//  Created by 申民鐡 on 2021/12/25.
//

import UIKit

class SecondViewController: UIViewController {
//    @IBAction func next(_ sender: UIButton) {
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let third = storyboard.instantiateViewController(withIdentifier: "ThirdViewController")
//        self.navigationController?.pushViewController(third, animated: true)q
//    }
    
    
    @IBOutlet weak var viewTableView: UITableView!
    let contentArray = ["게시판","업무","커뮤니티","회의실예약","사원정보","설정"]
    let contentImageArray = ["calendar","folder","display","alarm.fill","person.3.fill","questionmark.circle.fill"]
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let myTableViewCell = UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil)
        
        self.viewTableView.register(myTableViewCell, forCellReuseIdentifier: "myTableViewCell")
        self.viewTableView.rowHeight = UITableView.automaticDimension
        self.viewTableView.estimatedRowHeight = 120
        
        self.viewTableView.dataSource = self
        self.viewTableView.delegate = self
//        self.viewTableView.tableFooterView = UIView()
        self.title = "AIS Portal"
        let bacbutton = UIBarButtonItem(title:" < ", style: .plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = bacbutton
        
    }
}

//index를 선택하여.3
extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index\(indexPath.row)")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let AController = storyboard.instantiateViewController(withIdentifier: "AController") as! AController
        let BController = storyboard.instantiateViewController(withIdentifier: "BController") as! BController
        navigationController?.pushViewController(indexPath.row > 2 ? BController : AController , animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewTableView.deselectRow(at: indexPath,animated: true)
        let cell = viewTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
        cell.content.text = contentArray[indexPath.row]
        cell.imageview.image = UIImage(systemName: self.contentImageArray[indexPath.item])
        return cell
    }
    
    
}

extension SecondViewController: UITableViewDelegate {
    
}
