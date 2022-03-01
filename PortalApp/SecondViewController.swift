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
    
    
    let aVC = AController()
    
    @IBOutlet weak var viewTableView: UITableView!
    private enum contentArray:String,CaseIterable {
        case board = "게시판"
        case work = "업무"
        case community = "커뮤니티"
        case kaigi = "회의실예약"
        case userInfo = "사원정보"
        case settings = "설정"
        
        var imageName:String {
            switch self {
            case .board:
                return "calendar"
            case .work:
                return "folder"
            case .community:
                return "display"
            case .kaigi:
                return "alarm.fill"
            case .userInfo:
                return "person.3.fill"
            case .settings:
                return "questionmark.circle.fill"
            }
        }
    }
//    let contentArray = ["게시판","업무","커뮤니티","회의실예약","사원정보","설정"]
//    let contentImageArray = ["calendar","folder","display","alarm.fill","person.3.fill","questionmark.circle.fill"]
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
        return contentArray.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewTableView.deselectRow(at: indexPath,animated: true)
        let cell = viewTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
        cell.content.text = contentArray.allCases[indexPath.row].rawValue
        cell.imageview.image = UIImage(systemName: contentArray.allCases[indexPath.row].imageName)
        return cell
    }
    
    
}

extension SecondViewController: UITableViewDelegate {
    
}
