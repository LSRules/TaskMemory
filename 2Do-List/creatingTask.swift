//
//  creatingTask.swift
//  2Do-List
//
//  Created by Liam on 10/01/2018.
//  Copyright © 2018 Liam. All rights reserved.
//

import UIKit

class creatingTask: UIViewController {
    
    var previousVC = TableViewController()
    
    @IBOutlet weak var titletextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBAction func addButton(_ sender: Any) {
        
        let toDo = ToDo()
        
        if let titleText = titletextField.text {
        toDo.name = titleText
        toDo.important = importantSwitch.isOn
        
        previousVC.ToDos.append(toDo)
        previousVC.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
