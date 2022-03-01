//
//  LocationManager.swift
//  PortalApp
//
//  Created by 申民鐡 on 2022/03/01.
//

import Foundation
import CoreLocation

struct Location {
    let title: String
    let coordinates: CLLocationCoordinate2D //mapkit
}

class LocationManager:NSObject {
    
    
    
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    
    public func findLocation(with query: String, completion: @escaping(([Location]) -> Void)) {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(query){ places, error in
            //잘못되었을 때 places에 에러를 nil을넣고 completion에 빈배열을넣는다.
            guard let places = places, error == nil else {
                completion([])
                return
            }
            
            //models를 만들어 장소를 특정한다.
            let models: [Location] = places.compactMap({ place in
                var name = ""
                
                //동네를 넣어주고 다 더해준다.
                if let locationName = place.name {
                    name += locationName
                }
                
                //도시를 넣어주고
                if let adminRegion = place.administrativeArea {
                    name += ", \(adminRegion)"
                }
                
                //구 를 넣어주고
                if let locality = place.locality {
                    name += ", \(locality)"
                }
                
                //나라를 넣어주고
                if let country = place.country {
                    name += ", \(country)"
                }
                
                print("\n\(place)\n\n")
                //result에 location 네임과 장소를 넣어주고 리턴해준다.)
                let result = Location(
                    title: name,
                    coordinates: place.location!.coordinate)
            return result
            })
            //location을 반환해주는 completion에 모델을 반환시켜준다.
            completion(models)
        }
    }
}

