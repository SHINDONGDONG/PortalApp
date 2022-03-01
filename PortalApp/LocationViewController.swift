//
//  LocationViewController.swift
//  PortalApp
//
//  Created by 申民鐡 on 2022/03/01.
//

import UIKit
import MapKit
import FloatingPanel

class LocationViewController:UIViewController,SearchViewControllerDelegate {
    func searchViewController(_ vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?) {
        
        pannel.move(to: .tip, animated: true, completion: nil)
        mapView.removeAnnotations(mapView.annotations)
        
        guard let coordinates = coordinates else {
            return
        }
        //pin
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        mapView.addAnnotation(pin)
        mapView.setRegion(MKCoordinateRegion(center: coordinates,
                                             span: MKCoordinateSpan(
                                                latitudeDelta: 0.05,
                                                longitudeDelta: 0.05
                                             )
                                            ),
                          animated: true)

        
    }
    
    //MARK: Properties
    let mapView = MKMapView()

    //MARK: init
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    //MARK: Configures
    
    let pannel = FloatingPanelController()
    func config() {
        view.addSubview(mapView)
        view.backgroundColor = .systemGreen
        navigationController?.isNavigationBarHidden = true
        
        //Floating 판넬을 만들기
        let searchVC = SearchViewController()
        searchVC.delegate = self
        pannel.set(contentViewController: searchVC)
        
        //pannel을 자식으로 두는것
        pannel.addPanel(toParent: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }
}
