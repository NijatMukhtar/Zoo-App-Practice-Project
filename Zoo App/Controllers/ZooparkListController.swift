//
//  ViewController.swift
//  Zoo App
//
//  Created by Nijat Mukhtarov on 23.07.22.
//

import UIKit
import MapKit

class ZooparkListController: UIViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var collection: UICollectionView!
    
    var zoos = [Zoopark]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(ButtonImageButton.self, forCellWithReuseIdentifier: "ButtonImageButton")
    }

    func getDocumentsDirectoryUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func jsonSetup() {
        let jsonFile = self.getDocumentsDirectoryUrl().appendingPathComponent("Data.json")
        
        if let data = try? Data(contentsOf: jsonFile) {
            do {
                zoos = try JSONDecoder().decode([Zoopark].self, from: data)
            } catch{
                print(error.localizedDescription)
            }
        }
    }
    

    @IBAction func segmentTapped(_ sender: Any) {
        switch segment.selectedSegmentIndex{
        case 0:
            collection.isHidden = false
            map.isHidden = true
        case 1:
            collection.isHidden = false
            map.isHidden = true
        case 2:
            collection.isHidden = true
            map.isHidden = false
        default:
            break;
        }
    }
    
}

extension ZooparkListController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "ButtonImageButton", for: indexPath) as! ButtonImageButton
        
        return cell
    }
    

    
}
 
