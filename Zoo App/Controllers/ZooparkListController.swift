//
//  ViewController.swift
//  Zoo App
//
//  Created by Nijat Mukhtarov on 23.07.22.
//

import UIKit

class ZooparkListController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var zoos = [Zoopark]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(UINib(nibName: "ButtonButtonCell", bundle: nil), forCellReuseIdentifier: "ButtonButtonCell")
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "ButtonButtonCell", for: indexPath) as! ButtonButtonCell
        
        return cell
    }
    
}


 
