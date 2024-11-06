//
//  ViewController.swift
//  TravelBook
//
//  Created by Samet Arabacı on 4.11.2024.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
    }


}

