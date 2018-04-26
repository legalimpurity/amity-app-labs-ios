//
//  ViewController.swift
//  AmityIncubatorTableViewApp
//
//  Created by Amity AppLabs on 09/04/18.
//  Copyright © 2018 Amity Innovation Incubator. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var appLabStudentsTableView: UITableView!
    
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
//        getMockDataFunction()
        getActualDataFunction()
    }

    func getMockDataFunction() {
        dataSourceTitles.append("Animesh")
        dataSourceTitles.append("Sahil")
        dataSourceTitles.append("Rajat")
        
        dataSourceSubTitles.append("Verma")
        dataSourceSubTitles.append("Bhutani")
        dataSourceSubTitles.append("Khanna")
    }
    
    func getActualDataFunction()
    {
        Alamofire.request("http://194.168.1.208:8888/MyFirstAPI.php")
            .responseJSON { response in
                switch response.result
                {
                case .failure(_) :
                    return
                case .success(let data):
                    guard let json = data as? [String:AnyObject] else { return }
                    guard var maybeStudentResponseVariable = json["studentapiresponse"] as? [AnyObject] else { return }
                    for app_lab_student in maybeStudentResponseVariable
                    {
                        guard var studentFirstName = app_lab_student["first_name"] as? String else { return }
                        self.dataSourceTitles.append(studentFirstName)

                        guard var studentLastName = app_lab_student["last_name"] as? String else { return }

                        guard var studentAge = app_lab_student["age"] as? String else { return }

                        self.dataSourceSubTitles.append(studentAge)
                    }
                    self.appLabStudentsTableView.reloadData()
                }
        }
    }
}

