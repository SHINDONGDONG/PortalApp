//
//  CollectionViewCell.swift
//  PortalApp
//
//  Created by 申民鐡 on 2022/03/12.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    lazy var label1:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .label
        return label
    }()
    
    lazy var labelView:UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemOrange
        view.addSubview(self.label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }()
    
    var item1:String? {
        didSet {
            label1.text = item1
        }
    }
    
    lazy var imageView:UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Configures
    func configures() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        
        self.addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        labelView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        labelView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        labelView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    
    
}
