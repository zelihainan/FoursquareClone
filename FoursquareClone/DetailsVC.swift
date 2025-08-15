//
//  DetailsVC.swift
//  FoursquareClone
//
//  Created by Zeliha İnan on 15.08.2025.
//

import UIKit
import MapKit
import Parse

class DetailsVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsPlaceName: UILabel!
    @IBOutlet weak var detailsPlaceType: UILabel!
    @IBOutlet weak var detailsPlaceAtmosphere: UILabel!
    @IBOutlet weak var detailsMap: MKMapView!
    
    var chosenPlaceId = ""
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromParse()
        detailsMap.delegate = self
    }
        
    func getDataFromParse() {
        let query = PFQuery(className: "Places")
        query.whereKey( "objectId", equalTo: chosenPlaceId )
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
            }else {
                if objects != nil {
                    if objects!.count > 0 {
                        let chosenPlaceObject = objects![0]
                        if let placeName = chosenPlaceObject.object(forKey: "name") as? String {
                            self.detailsPlaceName.text = placeName
                        }
                        if let placeType = chosenPlaceObject.object(forKey: "type") as? String {
                            self.detailsPlaceType.text = placeType
                        }
                        if let placeAtmosphere = chosenPlaceObject.object(forKey: "atmosphere") as? String {
                            self.detailsPlaceAtmosphere.text = placeAtmosphere
                        }
                        if let placeLatitude = chosenPlaceObject.object(forKey: "latitude") as? String{
                            if let placeLatitudeDouble = Double(placeLatitude){
                                self.chosenLatitude = placeLatitudeDouble
                            }
                        }
                        if let placeLongitude = chosenPlaceObject.object(forKey: "longitude") as? String{
                            if let placeLongitudeDouble = Double(placeLongitude){
                                self.chosenLongitude = placeLongitudeDouble
                            }
                        }
                        if let imageData = chosenPlaceObject.object(forKey: "image") as? PFFileObject {
                            imageData.getDataInBackground { (data, error) in
                                if error == nil {
                                    self.detailsImageView.image = UIImage(data: data!)
                                }
                            }
                        }
                        
                        //MAPS
                        
                        let location = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                        let span = MKCoordinateSpan(latitudeDelta: 0.035, longitudeDelta: 0.035)
                        let region = MKCoordinateRegion(center: location, span: span)
                        self.detailsMap.setRegion(region, animated: true)
                        
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = location
                        annotation.title = self.detailsPlaceName.text
                        annotation.subtitle = self.detailsPlaceType.text
                        self.detailsMap.addAnnotation(annotation)
                       
                    }
                }
            }
        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if pinView == nil {
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        }else {
            
            pinView?.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if self.chosenLatitude != 0.0 && self.chosenLongitude != 0.0 {
            let requestLocation = CLLocation(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
            
            CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: self.chosenLatitude, longitude: self.chosenLongitude)) { (placemarks, error) in
                if let placemark = placemarks {
                    if placemark.count > 0 {
                        
                        let mkPlacemark = MKPlacemark(placemark: placemark[0])
                        let mapItem = MKMapItem(placemark: mkPlacemark)
                        mapItem.name = self.detailsPlaceName.text!
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                        mapItem.openInMaps(launchOptions: launchOptions)
                    }
                }
            }
        }
    }
}
