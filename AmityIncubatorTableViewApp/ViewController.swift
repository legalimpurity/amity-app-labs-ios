//
//  ViewController.swift
//  AmityIncubatorTableViewApp
//
//  Created by Amity AppLabs on 09/04/18.
//  Copyright © 2018 Amity Innovation Incubator. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataSourceTitles : Array = [String]()
    var dataSourceSubTitles : Array = [String]()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppLabStudentItem") as! AppLabStudentCell
        cell.firstName.text = dataSourceTitles[indexPath.row]
        cell.lastName.text = dataSourceSubTitles[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSourceTitles.append("Animesh")
        dataSourceTitles.append("Sahil")
        dataSourceTitles.append("Rajat")

        dataSourceSubTitles.append("Verma")
        dataSourceSubTitles.append("Bhutani")
        dataSourceSubTitles.append("Khanna")

    }

}

