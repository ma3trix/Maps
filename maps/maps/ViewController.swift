//
//  ViewController.swift
//  maps
//
//  Created by Malik Adebiyi on 2020-05-08.
//  Copyright © 2020 dotSandbox. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // declear location
        let latitude: CLLocationDegrees = 43.766326
        let logitude: CLLocationDegrees = -79.502713

        // Span / Zoom
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        
        // initialize span
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        // initialize location by addin coordinates
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: logitude)
        
        // asign location and span to region
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        // initialize reigion
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "Echelon"
        
        annotation.subtitle = "HQ.. Base of operation"
        
        annotation.coordinate = location
        
        map.addAnnotation(annotation)
        
        let uilongPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:)))
        
        uilongPress.minimumPressDuration = 2
         
        map.addGestureRecognizer(uilongPress)
        
    }
    
    @objc func longPress(gestureRecognizer: UIGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "New Place"
        
        annotation.subtitle = "Might Visit"
        
        map.addAnnotation(annotation)
        
    }


}

