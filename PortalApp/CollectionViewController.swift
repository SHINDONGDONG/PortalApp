//
//  CollectionViewController.swift
//  PortalApp
//
//  Created by 申民鐡 on 2022/03/12.
//

import UIKit

protocol CollectionViewControllerDelegate:AnyObject {
    func didSelect(item: CollectionViewController.list)
}

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    //MARK: Properties
    
    weak var delegate:CollectionViewControllerDelegate?
    
    enum list:String,CaseIterable {
        case shin = "shin"
        case min = "min"
        case cheol = "cheol"
        case lee = "lee"
        case kim = "kim"
        case su = "su"

        var itemImage:String {
            switch self {
            case .shin:
                return "airplane"
            case .min:
                return "gear"
            case .cheol:
                return "person"
            case .lee:
                return "arrow.left"
            case .kim:
                return "star"
            case .su:
                return "sun.min"
            }
        }
    }
    

    //MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.item1 = list.allCases[indexPath.row].rawValue
        cell.imageView.image = UIImage(systemName: list.allCases[indexPath.row].itemImage)
        return cell     
    }

    //MARK: Configures
    func configure() {
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = list.allCases[indexPath.row]
        delegate?.didSelect(item: item)
        
        print("did Select collection \(item.itemImage)")
    }
    
}

extension CollectionViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = ( view.frame.width - 30 ) / 3
        return CGSize(width: size  , height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 5, bottom: 5, right: 5)
    }
}
