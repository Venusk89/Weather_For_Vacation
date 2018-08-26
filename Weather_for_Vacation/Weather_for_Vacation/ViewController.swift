//
//  ViewController.swift
//  Weather_for_Vacation
//
//  Created by H on 2018. 7. 20..
//  Copyright © 2018년 H. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController {
    
    var lon: Double?
    var lat: Double?
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        checkAuthorizationStatus()
        startUpdatingLocation()
        
    }
    
    @IBAction func button(_ sender: UIButton) {
        
    }
    
    private func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        //        locationManager.requestAlwaysAuthorization()
        case .restricted, .denied:
            // Disable location features
            break
        case .authorizedWhenInUse:
            // Enable basic location features
            // enableMyWhenInUseFeatures()
            fallthrough
        case .authorizedAlways:
            // Enable any of your app's location features
            // enableMyAlwaysFeatures()
            startUpdatingLocation()
        }
    }
    
    func startUpdatingLocation() {
        let status = CLLocationManager.authorizationStatus()
        guard status == .authorizedAlways || status == .authorizedWhenInUse,
            CLLocationManager.locationServicesEnabled()
            else { return }
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10.0
        locationManager.startUpdatingLocation()//위치를 업데이트 하기 시작함
        
    }
    // Segue, Delegate, Closure, Sigleton, UserDefaults, Notification Center
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let latitude = lat, let longitude = lon else { return }
        let viewController = segue.destination as! TemperatureViewController
        viewController.latitude = latitude
        viewController.longitude = longitude
    }
}


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let current = locations.last
        
        print(current?.coordinate.latitude)
        print(current?.coordinate.longitude)
        
        guard let latitude = current?.coordinate.latitude, let longitude = current?.coordinate.longitude else { return }
        
        lat = latitude
        lon = longitude
        
        print(lon, lat)
        
        manager.stopUpdatingLocation()
    }
    
}

