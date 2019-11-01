//
//  TableviewController.swift
//  Midterm
//
//  Created by Jay Shah on 2019-11-01.
//  Copyright © 2019 Jay Shah. All rights reserved.
import UIKit

class TablebiewController: UIViewController, UITableViewDataSource , UITableViewDelegate{
   private let dwarves = [ "Toronto" , "Barrie" , "Niagra Falls" , "Ottawa" , "Edmonton", "Calgary" , "Fredickton" , "Nova Scotia" , "New Foundland" , "Victoria" , "Vancouver" , "Winipeg" , "St. John's" , "Saskatoon" ]

    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: simpleTableIdentifier)
        }
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        cell?.textLabel?.text = dwarves[indexPath.row]
        return cell!
    }
    
        //Mark: Table View Delegate methods
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You have selected \(rowValue)"
        let controller = UIAlertController(title: "Row Selected", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes I did", style: .default, handler: nil)
        controller.addAction(action)
        present(controller , animated: true , completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
