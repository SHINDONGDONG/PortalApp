//
//  AController.swift
//  PortalApp
//
//  Created by 申民鐡 on 2022/01/15.
//

import Foundation
import UIKit
//사이드 메뉴를 임포트해준다.
import SideMenu
import WebKit


class AController: UIViewController {
    
    //사이드 메뉴네비게이션 컨트롤러를 정의해주고
    var menu: SideMenuNavigationController?
    //webKit
    let webView = WKWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "A Controller"
        
        //메뉴에 사이드네비게이션 컨트롤러 루트 컨트롤러를 uiviewController로 지정해준다.
        //이제 rootviewcontroller는 menulistController를 보여줄것이다.
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        //메뉴바가 왼쪽에서부터 슬라이드해서 나오는형식으로.
        menu?.leftSide = true
        //menu 네비게이션바를 숨긴다.
        menu?.setNavigationBarHidden(true, animated: false)
        //SidemenuManager한테 메뉴의 디폴트값은 left메뉴 컨트롤러라고 알려준다.
        SideMenuManager.default.leftMenuNavigationController = menu
        //메뉴바가 열려있지 않는 상황에서 슬라이드로 여는 방ㄷ법
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        configRightItems()
    }
    
    //button을 누르면 메뉴바가 사이드에서 나온다
    @IBAction func didTapMenu() {
        present(menu!, animated: true)
    }
    
    func configRightItems() {
        let button = navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapClose))
    }
    
   
    @objc func didTapClose(){
        navigationController?.popViewController(animated: true)
    }
    
}





//메뉴에 들어갈 uitable을 만들어준다.
class MenuListController: UITableViewController {
    
    var items = ["IOS","Android","WEB","Flutter","Linux"]
    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    
    //viewdidload를 호출한다.
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableview에 레지스터를 등록하여 uitableviewcell, cell 리유즈 identifier는 cellㅇ로 지정함. (cellforRowAt)에서 withidentifier를 cell로지정했기 때문에
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = darkColor
    }
    
    //테이블을 갯수만큼 리턴한다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    //cell을 만들어준다.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell을 만들어준다 tableview.dequeueReusableCell(withIndentifier cell. for indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",  for: indexPath)
        // textlable . text에 items를 하나씩 넣어준다.
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        return cell
    }
    
    //select가 해제 된 indexPath를 선택해제 시킨다.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let webView = storyboard.instantiateViewController(withIdentifier: "WebViewController")
        navigationController?.pushViewController(WebViewController(), animated: true)
    }
    
}


