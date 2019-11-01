//
//  PickerViewController.swift
//  Midterm
//
//  Created by Jay Shah on 2019-11-01.
//  Copyright © 2019 Jay Shah. All rights reserved.
//

import MapKit
import UIKit

class PickerViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate{
   
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    private let schools = [ "CN  Tower", "Niagra Falls"]
    
    private let levels = ["-2", "-1", "0", "+1", "+2"]

    private let schoolsDegrees = [
        0: ["latitude": 43.6426, "longitude": -79.387054],
        1: ["latitude": 43.0896, "longitude": -79.0849],

    ]
    
    private let zoomLevels = [
        0: 2,
        1: 1,
        2: 0.5,
        3: 0.1,
        4: 0.01
    ]
    
    private let schoolsComponent = 0
    private let levelsComponent = 1
    
   
    
    
    
    private var latestLocation = ""
    
    private var coordinates = CLLocationCoordinate2D()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    @IBAction func locatebutton(_ sender: Any) {
         let schoolRow =
                   pickerView.selectedRow(inComponent: schoolsComponent)
               let levelRow =
                   pickerView.selectedRow(inComponent: levelsComponent)
               let school = schools[schoolRow]
               let level = levels[levelRow]
           
           
               let latitude = (schoolsDegrees[schoolRow]?["latitude"])!
               let longitude = schoolsDegrees[schoolRow]?["longitude"]
               
               
               let lanDelta = zoomLevels[levelRow]
               let lonDelta = zoomLevels[levelRow]
           
               let span = MKCoordinateSpan(latitudeDelta: lanDelta!, longitudeDelta: lonDelta!)

               coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude!)
               
               let region = MKCoordinateRegion(center: coordinates, span: span)
           
               mapView.setRegion(region, animated: true)
               
               latestLocation = String(school);

    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if (component == schoolsComponent)
        {
            return schools.count
        }
        else {
            return levels.count
        }
        
    }
    
    
    // MARK:-
    // MARK: Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component:
        Int) -> String? {
        
        if (component == schoolsComponent){
            return schools[row]
        }
        else {
            return levels[row]
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
