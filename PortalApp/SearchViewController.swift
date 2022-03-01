//
//  SearchViewController.swift
//  PortalApp
//
//  Created by 申民鐡 on 2022/03/01.
//

import UIKit
import CoreLocation


protocol SearchViewControllerDelegate:AnyObject {
    func searchViewController(_ vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?)
    
    
}
class SearchViewController:UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = locations[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        cell.contentView.backgroundColor = .secondarySystemBackground
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //지도에 계속알리고 표시
        let coordinated = locations[indexPath.row].coordinates
        delegate?.searchViewController(self, didSelectLocationWith: coordinated)
    }
    
    //MARK: Properties
    weak var delegate:SearchViewControllerDelegate?
    
    private var label:UILabel = {
        let label = UILabel()
        label.text = "Where to?"
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        return label
    }()
    
    private var searchTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search this"
        tf.layer.cornerRadius = 9
        tf.backgroundColor = .tertiarySystemGroupedBackground
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        return tf
    }()
    
    private var tableView:UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       return table
    }()

    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        

    }
    var locations = [Location]()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.sizeToFit()
        label.frame = CGRect(x: 10, y: 10, width: label.frame.size.width, height: label.frame.size.height)
        searchTextField.frame = CGRect(x: 10, y: label.frame.size.height+20, width: view.frame.size.width-20, height: 50)
        let tableY: CGFloat = searchTextField.frame.origin.y + searchTextField.frame.size.height+5
        tableView.frame = CGRect(x: 0, y: tableY, width: view.frame.size.width, height: view.frame.size.height-tableY)
    }
    
    //MARK: Configures
    func config(){
        view.backgroundColor = .secondarySystemGroupedBackground
        view.addSubview(label)
        view.addSubview(searchTextField)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        searchTextField.delegate = self
        tableView.backgroundColor = .secondarySystemBackground
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        if let text = searchTextField.text, !text.isEmpty {
            LocationManager.shared.findLocation(with: text) { [ weak self ] locations in
                DispatchQueue.main.async {
                    self?.locations = locations
                    self?.tableView.reloadData()
                }
            }
        }
        return true
    }
    
}
